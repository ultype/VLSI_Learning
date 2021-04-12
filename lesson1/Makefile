VFLAG := +acc

MODULE_PATH := ./module
TEST_PATH := ./testbench

MODULE    = $(wildcard $(MODULE_PATH)/*.v)
TEST      = $(wildcard $(TEST_PATH)/*.v)
TOP       = $(strip $(patsubst %.v, %, $(notdir $(TEST))))  # For simulation
SIMMODULE = $(addprefix module_lib., $(patsubst %.v, %,  $(notdir $(MODULE))))

$(info $(MODULE))
$(info $(TEST))
$(info $(TOP))
$(info $(SIMMODULE))


VLIB = ./work

all: 	compile

test:
	vsim -c -do "run -All" $(TOP)

sim:
	vsim $(TOP) $(SIMMODULE)
	

clean:
	rm -f *~ Avlog.dmp transcript *.ini
	rm -rf work	module_lib


compile:
	vlog $(VFLAG) $(MODULE) $(TEST)
	vlib module_lib
	vmap work module_lib



# vsim -c : command line mode
# 
