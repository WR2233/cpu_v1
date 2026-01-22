SRC = src

CXXFLAGS = -std=c++17 -Wall -Wextra -O2 \
           -I$(SRC) \
           -I/opt/homebrew/opt/yaml-cpp/include

LDFLAGS = -L/opt/homebrew/opt/yaml-cpp/lib -lyaml-cpp

TARGET = pipeline_sim

OBJDIR = build

FPU_MODE ?= sim
FPU_SIM_OP ?=          # fadd, fsub, fmul, ...

COMMON_SOURCES = \
    $(SRC)/main.cpp \
    $(SRC)/core/instruction.cpp \
    $(SRC)/pipeline/hazard/hazard_unit.cpp \
    $(SRC)/pipeline/forwarding/forwarding_unit.cpp \
    $(SRC)/pipeline/stages/fetch_stage.cpp \
    $(SRC)/pipeline/stages/decode_stage.cpp \
    $(SRC)/pipeline/stages/execute_stage.cpp \
    $(SRC)/pipeline/stages/mem_stage.cpp \
    $(SRC)/pipeline/stages/wb_stage.cpp \
    $(SRC)/pipeline/pipeline.cpp \
    $(SRC)/debug/debugger.cpp \
    $(SRC)/debug/profile.cpp \
    $(SRC)/memory/memory.cpp \
    $(SRC)/memory/cache.cpp \
    $(SRC)/fpu/fpu_emulator.cpp

ifeq ($(FPU_MODE),soft)
CXXFLAGS += -DFPU_MODE_SOFT

FPU_SOURCES = \
    $(SRC)/fpu/soft/fadd_soft.cpp \
    $(SRC)/fpu/soft/fsub_soft.cpp \
    $(SRC)/fpu/soft/fmul_soft.cpp \
    $(SRC)/fpu/soft/fdiv_soft.cpp \
    $(SRC)/fpu/soft/finv_soft.cpp \
    $(SRC)/fpu/soft/fsqrt_soft.cpp \
    $(SRC)/fpu/soft/fisqrt_soft.cpp \
    $(SRC)/fpu/soft/ftoi_soft.cpp \
    $(SRC)/fpu/soft/itof_soft.cpp 

# --- 1命令だけ sim に差し替え ---
ifeq ($(FPU_SIM_OP),fadd)
FPU_SOURCES := $(filter-out %fadd_soft.cpp,$(FPU_SOURCES))
FPU_SOURCES += $(SRC)/fpu/sim/fadd_sim.cpp
endif

ifeq ($(FPU_SIM_OP),fsub)
FPU_SOURCES := $(filter-out %fsub_soft.cpp,$(FPU_SOURCES))
FPU_SOURCES += $(SRC)/fpu/sim/fsub_sim.cpp
endif

ifeq ($(FPU_SIM_OP),fmul)
FPU_SOURCES := $(filter-out %fmul_soft.cpp,$(FPU_SOURCES))
FPU_SOURCES += $(SRC)/fpu/sim/fmul_sim.cpp
endif

ifeq ($(FPU_SIM_OP),fdiv)
FPU_SOURCES := $(filter-out %fdiv_soft.cpp,$(FPU_SOURCES))
FPU_SOURCES += $(SRC)/fpu/sim/fdiv_sim.cpp
endif

ifeq ($(FPU_SIM_OP),finv)
FPU_SOURCES := $(filter-out %finv_soft.cpp,$(FPU_SOURCES))
FPU_SOURCES += $(SRC)/fpu/sim/finv_sim.cpp
endif

ifeq ($(FPU_SIM_OP),fsqrt)
FPU_SOURCES := $(filter-out %fsqrt_soft.cpp,$(FPU_SOURCES))
FPU_SOURCES += $(SRC)/fpu/sim/fsqrt_sim.cpp
endif

ifeq ($(FPU_SIM_OP),fisqrt)
FPU_SOURCES := $(filter-out %fisqrt_soft.cpp,$(FPU_SOURCES))
FPU_SOURCES += $(SRC)/fpu/sim/fisqrt_sim.cpp
endif

ifeq ($(FPU_SIM_OP),ftoi)
FPU_SOURCES := $(filter-out %ftoi_soft.cpp,$(FPU_SOURCES))
FPU_SOURCES += $(SRC)/fpu/sim/ftoi_sim.cpp
endif

ifeq ($(FPU_SIM_OP),itof)
FPU_SOURCES := $(filter-out %itof_soft.cpp,$(FPU_SOURCES))
FPU_SOURCES += $(SRC)/fpu/sim/itof_sim.cpp
endif

else ifeq ($(FPU_MODE),sim)
CXXFLAGS += -DFPU_MODE_SIM

FPU_SOURCES = \
    $(SRC)/fpu/sim/fadd_sim.cpp \
    $(SRC)/fpu/sim/fsub_sim.cpp \
    $(SRC)/fpu/sim/fmul_sim.cpp \
    $(SRC)/fpu/sim/fdiv_sim.cpp \
    $(SRC)/fpu/sim/finv_sim.cpp \
    $(SRC)/fpu/sim/fsqrt_sim.cpp \
    $(SRC)/fpu/sim/fisqrt_sim.cpp \
    $(SRC)/fpu/sim/ftoi_sim.cpp \
    $(SRC)/fpu/sim/itof_sim.cpp

else
$(error Unknown FPU_MODE: $(FPU_MODE))
endif

# ========================
# Build rules
# ========================
SOURCES = $(COMMON_SOURCES) $(FPU_SOURCES)
OBJECTS = $(SOURCES:$(SRC)/%.cpp=$(OBJDIR)/%.o)

$(OBJDIR)/%.o: $(SRC)/%.cpp
	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) -c $< -o $@

all: $(TARGET)

soft:
	$(MAKE) FPU_MODE=soft

$(TARGET): $(OBJECTS)
	$(CXX) $(CXXFLAGS) -o $@ $(OBJECTS) $(LDFLAGS)

clean:
	rm -rf $(OBJDIR) $(TARGET)

run: $(TARGET)
	./$(TARGET)

.PHONY: all soft clean run