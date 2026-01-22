#include "pipeline/pipeline.h"
#include "debug/debugger.h"
#include "debug/profile.h"
#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <vector>
#include <algorithm>
#include <cctype>
#include <cstdlib>
#include <cstring>
#include <iomanip>
#include <unistd.h>

namespace
{
    struct Log
    {
        uint32_t pc;
        std::string rw; //"read" | "write" | ""
        uint32_t mem_address;
        uint32_t data;
        std::string inst;
        uint32_t aluResult;
        uint32_t operandA;
        uint32_t operandB;
    };

    // ファイル拡張子を取得
    std::string getFileExtensions(const std::vector<std::string> &filenames)
    {
        if (filenames.empty())
        {
            return "";
        }

        std::string ext = "";
        for (size_t i = 0; i < filenames.size(); ++i)
        {
            auto pos = filenames[i].find_last_of('.');
            if (pos == std::string::npos)
            {
                return "";
            }
            std::string tmp = filenames[i].substr(pos);
            // 小文字に変換
            std::transform(tmp.begin(), tmp.end(), tmp.begin(), ::tolower);
            if (i == 0)
            {
                ext = tmp;
            }
            else if (ext != tmp)
            {
                return ""; // 拡張子が異なる場合は空文字を返す
            }
        }

        return ext;
    }
}

// バイナリファイルを読み込む
std::vector<uint32_t> loadBinaryFile(const std::string &filename)
{
    std::vector<uint32_t> program;
    std::ifstream file(filename, std::ios::binary);

    if (!file.is_open())
    {
        std::cerr << "Error: Cannot open binary file " << filename << std::endl;
        return program;
    }

    // ファイルサイズを取得
    file.seekg(0, std::ios::end);
    size_t fileSize = file.tellg();
    file.seekg(0, std::ios::beg);

    // 4バイト単位で読み込み
    size_t numInstructions = fileSize / 4;
    program.resize(numInstructions);

    file.read(reinterpret_cast<char *>(program.data()), fileSize);
    file.close();

    return program;
}

// アセンブリファイルをアセンブルして機械語を取得（複数ファイル対応）
std::vector<uint32_t> assembleFiles(const std::vector<std::string> &filenames)
{
    std::vector<uint32_t> program;

    // 一時ファイル名を生成
    char tempFile[] = "/tmp/pipeline_sim_XXXXXX.bin";
    int fd = mkstemps(tempFile, 4);
    if (fd == -1)
    {
        std::cerr << "Error: Cannot create temporary file" << std::endl;
        return program;
    }
    close(fd);

    // アセンブラのパスを探す
    std::string assemblerPath = "../assembler/assembler.py";
    std::ifstream testFile(assemblerPath);
    if (!testFile.good())
    {
        assemblerPath = "../../assembler/assembler.py";
        testFile.open(assemblerPath);
        if (!testFile.good())
        {
            std::cerr << "Error: Cannot find assembler.py" << std::endl;
            std::cerr << "       Tried: ../assembler/assembler.py and ../../assembler/assembler.py" << std::endl;
            return program;
        }
    }
    testFile.close();

    // 複数ファイルを引数に追加
    std::string inputFiles;
    for (const auto &file : filenames)
    {
        inputFiles += " \"" + file + "\"";
    }

    // Pythonアセンブラを呼び出す
    std::string command = "python3 " + assemblerPath + inputFiles + " -o \"" + tempFile + "\" -f binary";
    std::cout << "Running assembler: " << command << std::endl;

    int ret = system(command.c_str());
    if (ret != 0)
    {
        std::cerr << "Error: Assembler failed with exit code " << ret << std::endl;
        unlink(tempFile);
        return program;
    }

    // アセンブル結果を読み込む
    program = loadBinaryFile(tempFile);

    // バイナリの一時ファイルを削除
    unlink(tempFile);

    return program;
}

// アセンブリソースファイルを読み込む
std::vector<std::string> loadSourceFile(const std::string &filename)
{
    std::vector<std::string> lines;
    std::ifstream file(filename);

    if (!file.is_open())
    {
        std::cerr << "Error: Cannot open source file " << filename << std::endl;
        return lines;
    }

    std::string line;
    while (std::getline(file, line))
    {
        lines.push_back(line);
    }

    file.close();
    return lines;
}

// 使用方法を表示
void printUsage(const char *programName)
{
    std::cout << "Usage: " << programName << " [options] <input_file(s)>\n";
    std::cout << "\nOptions:\n";
    std::cout << "  -d, --debug     Launch interactive debugger\n";
    std::cout << "  -h, --help      Show this help message\n";
    std::cout << "      --get-history  Dump memory/MMIO/PC histories to files\n";
    std::cout << "      --get-log   Dump per-instruction log to log/log.txt\n";
    std::cout << "\nSupported input file formats:\n";
    std::cout << "  .s, .riscv     Assembly source file (will be assembled automatically)\n";
    std::cout << "                 Multiple assembly files can be specified for linking\n";
    std::cout << "  .bin            Binary machine code file (little-endian 32-bit words)\n";
}

// Pythonアセンブラを呼び出してマージされたソースコードを取得
std::vector<std::string> getSourceLines(const std::vector<std::string> &inputFiles)
{
    std::vector<std::string> lines;

    // 一時ファイル名を生成
    char tempSourceFile[] = "/tmp/pipeline_source_XXXXXX.s";
    int fd = mkstemps(tempSourceFile, 2);
    if (fd == -1)
    {
        std::cerr << "Error: Cannot create temporary source file" << std::endl;
        return lines;
    }
    close(fd);

    // アセンブラのパスを探す
    std::string assemblerPath = "../assembler/assembler.py";
    std::ifstream testFile(assemblerPath);
    if (!testFile.good())
    {
        assemblerPath = "../../assembler/assembler.py";
        testFile.open(assemblerPath);
        if (!testFile.good())
        {
            std::cerr << "Error: Cannot find assembler.py" << std::endl;
            unlink(tempSourceFile);
            return lines;
        }
    }
    testFile.close();

    // 複数ファイルを引数に追加
    std::string inputFilesStr;
    for (const auto &file : inputFiles)
    {
        inputFilesStr += " \"" + file + "\"";
    }

    // Pythonアセンブラを呼び出してマージされたソースコードを出力
    std::string command = "python3 " + assemblerPath + inputFilesStr +
                          " --assemble-output \"" + tempSourceFile + "\"";

    int ret = system(command.c_str());
    if (ret != 0)
    {
        std::cerr << "Error: Assembler failed with exit code " << ret << std::endl;
        unlink(tempSourceFile);
        return lines;
    }

    // マージされたソースファイルを読み込む
    std::ifstream sourceFile(tempSourceFile);
    if (!sourceFile.is_open())
    {
        std::cerr << "Error: Cannot open merged source file" << std::endl;
        unlink(tempSourceFile);
        return lines;
    }

    std::string line;
    while (std::getline(sourceFile, line))
    {
        lines.push_back(line);
    }

    sourceFile.close();
    unlink(tempSourceFile);

    return lines;
}

// Pythonアセンブラを呼び出してPC→行番号マッピングを取得
std::unordered_map<uint32_t, int> getPCtoLines(const std::vector<std::string> &inputFiles)
{
    std::unordered_map<uint32_t, int> mapping;

    // 一時ファイル名を生成
    char tempMappingFile[] = "/tmp/pipeline_mapping_XXXXXX.txt";
    int fd = mkstemps(tempMappingFile, 4);
    if (fd == -1)
    {
        std::cerr << "Error: Cannot create temporary mapping file" << std::endl;
        return mapping;
    }
    close(fd);

    // アセンブラのパスを探す
    std::string assemblerPath = "../assembler/assembler.py";
    std::ifstream testFile(assemblerPath);
    if (!testFile.good())
    {
        assemblerPath = "../../assembler/assembler.py";
        testFile.open(assemblerPath);
        if (!testFile.good())
        {
            std::cerr << "Error: Cannot find assembler.py" << std::endl;
            unlink(tempMappingFile);
            return mapping;
        }
    }
    testFile.close();

    // 複数ファイルを引数に追加
    std::string inputFilesStr;
    for (const auto &file : inputFiles)
    {
        inputFilesStr += " \"" + file + "\"";
    }

    // Pythonアセンブラを呼び出してPC→行番号マッピングを出力
    std::string command = "python3 " + assemblerPath + inputFilesStr +
                          " --pc-mapping \"" + tempMappingFile + "\"";

    int ret = system(command.c_str());
    if (ret != 0)
    {
        std::cerr << "Error: Assembler failed with exit code " << ret << std::endl;
        unlink(tempMappingFile);
        return mapping;
    }

    // マッピングファイルを読み込む
    std::ifstream mappingFile(tempMappingFile);
    if (!mappingFile.is_open())
    {
        std::cerr << "Error: Cannot open mapping file" << std::endl;
        unlink(tempMappingFile);
        return mapping;
    }

    // ファイル形式: "PC(10進数) LINE(10進数)"
    uint32_t pc;
    int line;
    while (mappingFile >> pc >> line)
    {
        mapping[pc] = line - 1;
    }

    mappingFile.close();
    unlink(tempMappingFile);

    return mapping;
}

int main(int argc, char *argv[])
{
    bool debugMode = false;
    bool getHistory = false;
    bool getLog = false;
    std::vector<std::string> inputFiles;

    // コマンドライン引数の解析
    for (int i = 1; i < argc; ++i)
    {
        std::string arg = argv[i];
        if (arg == "-d" || arg == "--debug")
        {
            debugMode = true;
        }
        else if (arg == "-h" || arg == "--help")
        {
            printUsage(argv[0]);
            return 0;
        }
        else if (arg == "--get-history")
        {
            getHistory = true;
        }
        else if (arg == "--get-log")
        {
            getLog = true;
        }
        else
        {
            inputFiles.push_back(arg);
        }
    }

    if (inputFiles.empty())
    {
        std::cerr << "Error: No input file specified\n\n";
        printUsage(argv[0]);
        return 1;
    }

    std::string ext = getFileExtensions(inputFiles);
    std::vector<uint32_t> program;
    std::vector<std::string> sourceLines;
    std::unordered_map<uint32_t, int> pc_to_line;

    // ファイル形式を確認
    if (ext == ".bin")
    {
        if (inputFiles.size() > 1)
        {
            std::cerr << "Error: Binary input does not support multiple files\n";
            return 1;
        }
        if (debugMode)
        {
            std::cerr << "Error: Debug Mode does not support Binary input\n";
            return 1;
        }
        std::cout << "Loading binary file..." << std::endl;
        program = loadBinaryFile(inputFiles[0]);
    }
    else
    {
        std::cout << "Assembling " << inputFiles.size() << " source file(s)..." << std::endl;
        program = assembleFiles(inputFiles);
        // デバッガモードの場合はアセンブリソース, pc_to_lineも保存
        if (debugMode)
        {
            sourceLines = getSourceLines(inputFiles);
            pc_to_line = getPCtoLines(inputFiles);
        }
    }

    if (program.empty())
    {
        std::cerr << "Error: No valid instructions loaded\n";
        return 1;
    }

    std::cout << "Loaded " << program.size() << " instructions\n";

    // プロセッサを初期化
    PipelineProcessor processor;
    processor.loadProgram(program);

    if (debugMode)
    {
        PipelineDebugger debugger(processor);

        // ソースコード, pc_to_lineが利用可能な場合は設定
        if (!sourceLines.empty())
        {
            debugger.setSourceLines(sourceLines);
        }
        if (!pc_to_line.empty())
        {
            debugger.setPCtoLine(pc_to_line);
        }

        debugger.runInteractive();
        return 0;
    }

    ExecutionProfile profile(processor);

    std::cout << "\n=== Starting Simulation ===\n";

    constexpr size_t HISTORY_FLUSH_THRESHOLD = 1024;
    std::vector<std::pair<uint32_t, uint32_t>> writeHistoryBuf;
    std::vector<std::pair<uint32_t, uint32_t>> readHistoryBuf;
    std::vector<uint8_t> mmioHistoryBuf;
    std::vector<uint32_t> pcHistoryBuf;
    std::vector<Log> logBuf;
    std::ofstream writeHistoryFile;
    std::ofstream readHistoryFile;
    std::ofstream mmioHistoryFile;
    std::ofstream pcHistoryFile;
    std::ofstream logFile;

    if (getHistory)
    {
        writeHistoryFile.open("./log/write.txt", std::ios::out | std::ios::trunc);
        readHistoryFile.open("./log/read.txt", std::ios::out | std::ios::trunc);
        mmioHistoryFile.open("./log/mmio_history.txt", std::ios::out | std::ios::trunc);
        pcHistoryFile.open("./log/pc_history.txt", std::ios::out | std::ios::trunc);

        if (!writeHistoryFile || !readHistoryFile || !mmioHistoryFile || !pcHistoryFile)
        {
            std::cerr << "Error: failed to open history output files" << std::endl;
            return 1;
        }
    }

    if (getLog)
    {
        logFile.open("./log/log.txt", std::ios::out | std::ios::trunc);
        if (!logFile)
        {
            std::cerr << "Error: failed to open log file" << std::endl;
            return 1;
        }
    }
    int writeCnt = 0;
    int readCnt = 0;
    auto flushLogBuffer = [&](bool force)
    {
        if (!getLog)
        {
            return;
        }

        auto flushLog = [&]()
        {
            if (!force && logBuf.size() < HISTORY_FLUSH_THRESHOLD)
                return;

            auto toHex = [](uint32_t value, int width)
            {
                std::ostringstream oss;
                oss << "0x" << std::hex << std::setw(width) << std::setfill('0') << value << std::dec;
                return oss.str();
            };

            for (const auto &entry : logBuf)
            {
                const std::string rw = entry.rw.empty() ? "-" : entry.rw;
                if (rw == "write")
                {
                    writeCnt++;
                }
                else if (rw == "read")
                {
                    readCnt++;
                }
                logFile << "pc=" << toHex(entry.pc, 8)
                        << ", rw=" << rw
                        << ", addr=" << toHex(entry.mem_address, 8)
                        << ", data=" << toHex(entry.data, 8)
                        << ", inst=" << entry.inst
                        << ", w count = " << writeCnt
                        << ", r count = " << readCnt
                        << ", aluResult = " << entry.aluResult
                        << ", operandA = " << entry.operandA
                        << ", operandB = " << entry.operandB
                        << "\n";
            }
            logFile.flush();
            logBuf.clear();
        };

        flushLog();
    };

    auto flushHistoryBuffers = [&](bool force)
    {
        if (!getHistory)
        {
            return;
        }

        auto flushWrites = [&]()
        {
            if (!force && writeHistoryBuf.size() < HISTORY_FLUSH_THRESHOLD)
                return;
            for (const auto &entry : writeHistoryBuf)
            {
                writeHistoryFile << "0x" << std::hex << std::setw(8) << std::setfill('0') << entry.first << "\n";
                writeHistoryFile << "0x" << std::hex << std::setw(8) << std::setfill('0') << entry.second << "\n";
            }
            writeHistoryFile.flush();
            writeHistoryBuf.clear();
        };

        auto flushReads = [&]()
        {
            if (!force && readHistoryBuf.size() < HISTORY_FLUSH_THRESHOLD)
                return;
            for (const auto &entry : readHistoryBuf)
            {
                readHistoryFile << "0x" << std::hex << std::setw(8) << std::setfill('0') << entry.first << "\n";
                readHistoryFile << "0x" << std::hex << std::setw(8) << std::setfill('0') << entry.second << "\n";
            }
            readHistoryFile.flush();
            readHistoryBuf.clear();
        };

        auto flushMmio = [&]()
        {
            if (!force && mmioHistoryBuf.size() < HISTORY_FLUSH_THRESHOLD)
                return;
            for (const auto byte : mmioHistoryBuf)
            {
                mmioHistoryFile << "0x" << std::hex << std::setw(2) << std::setfill('0') << static_cast<uint32_t>(byte) << "\n";
            }
            mmioHistoryFile.flush();
            mmioHistoryBuf.clear();
        };

        auto flushPc = [&]()
        {
            if (!force && pcHistoryBuf.size() < HISTORY_FLUSH_THRESHOLD)
                return;
            for (const auto pc : pcHistoryBuf)
            {
                pcHistoryFile << "0x" << std::hex << std::setw(8) << std::setfill('0') << pc << "\n";
            }
            pcHistoryFile.flush();
            pcHistoryBuf.clear();
        };

        flushWrites();
        flushReads();
        flushMmio();
        flushPc();
    };

    // シミュレーション実行
    uint64_t max_cycle = 10000000000000000;
    while (processor.isRunning())
    {
        processor.clock();
        profile.onCycleEnd();
        const auto &snapshot = processor.getLogSnapshot();
        if (getHistory)
        {
            if (!snapshot.pipelineFrozen && !snapshot.ex_mem_snapshot.stall && snapshot.ex_mem_snapshot.inst.raw != 0)
            {
                pcHistoryBuf.push_back(snapshot.ex_mem_snapshot.pc);
            }
            if (snapshot.dataBus.valid)
            {
                if (snapshot.dataBus.write && !snapshot.mmioWrite)
                {
                    writeHistoryBuf.emplace_back(snapshot.dataBus.address, snapshot.dataBus.writeData);
                }
                else if (!snapshot.mmioWrite)
                {
                    readHistoryBuf.emplace_back(snapshot.dataBus.address, snapshot.dataBus.readData);
                }
            }
            if (snapshot.mmioWrite)
            {
                mmioHistoryBuf.push_back(snapshot.mmioValue);
            }
            flushHistoryBuffers(false);
        }
        if (getLog)
        {
            if (!snapshot.pipelineFrozen && !snapshot.ex_mem_snapshot.stall && snapshot.ex_mem_snapshot.inst.raw != 0)
            {
                std::string rw;
                uint32_t mem_address = 0;
                uint32_t data = 0;

                if (snapshot.dataBus.valid)
                {
                    mem_address = snapshot.dataBus.address;
                    if (snapshot.dataBus.write)
                    {
                        rw = "write";
                        data = snapshot.dataBus.writeData;
                    }
                    else
                    {
                        rw = "read";
                        data = snapshot.dataBus.readData;
                    }
                }

                logBuf.push_back({snapshot.ex_mem_snapshot.pc, rw, mem_address, data, snapshot.ex_mem_snapshot.inst.toString(), snapshot.ex_mem_snapshot.aluResult, snapshot.ex_mem_snapshot.operandA, snapshot.ex_mem_snapshot.operandB});
                flushLogBuffer(false);
            }
        }

        uint64_t cycle_num = snapshot.cycle;
        if (cycle_num > max_cycle)
        {
            std::cout << "cycle reached : " << cycle_num << "cycles";
            break;
        }
    }

    flushHistoryBuffers(true);
    flushLogBuffer(true);

    // 結果を表示
    std::cout << "\n=== Simulation Complete ===\n";
    std::cout << "Results in x10 (a0): " << processor.getRegister(10) << std::endl;
    processor.printRegisters();
    processor.printStatistics();
    profile.printInstructionProfile();

    return 0;
}
