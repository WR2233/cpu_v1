#ifndef PIPELINE_DEBUGGER_H
#define PIPELINE_DEBUGGER_H

#include "../pipeline/pipeline.h"
#include <set>
#include <string>
#include <vector>
#include <unordered_map>

class PipelineDebugger
{
public:
    explicit PipelineDebugger(PipelineProcessor &cpu);

    void runInteractive();
    void setPCtoLine(const std::unordered_map<uint32_t, int> &pc_to_line_dict);
    void setSourceLines(const std::vector<std::string> &lines);

private:
    PipelineProcessor &cpu;
    std::set<uint32_t> breakpoints;
    std::vector<std::string> sourceLines;
    std::unordered_map<uint32_t, int> pc_to_line;
    std::unordered_map<int, uint32_t> line_to_pc;
    bool running = true;

    static std::string trim(const std::string &s);
    static std::vector<std::string> tokenize(const std::string &line);
    static bool parseUint32(const std::string &text, uint32_t &value);

    void printHelp() const;
    void printSnapshot() const;
    void printBuses() const;
    void printMemory(uint32_t address, uint32_t count) const;
    void printStack(uint32_t count = 10) const;
    void printFloatRegisters() const;
    void printPipeline() const;
    void printRegister(const std::string &regName) const;
    void printRegisters() const;
    void printSourceContext(int lines_before = 3, int lines_after = 3) const;
    void listBreakpoints() const;
    void addBreakpoint(uint32_t pc);
    void removeBreakpoint(uint32_t pc);
    void continueExecution();
    bool step(bool show = true);
    void handleCommand(const std::string &command);

    static const char *getRegisterName(uint8_t index);
    static const char *getfpRegisterName(uint8_t index);
    static int getRegisterIndex(const std::string &name);
};

#endif // PIPELINE_DEBUGGER_H
