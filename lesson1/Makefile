VFLAG := +acc
SIMFILE := top.v op.v recip.v
VLIB = ./work

all: 	compile test sim

test:
	vsim -c -do "run -All" top

sim:
	vsim top

clean:
	rm -f *~ Avlog.dmp transcript
	rm -rf work	


compile:
	vlog $(VFLAG) $(SIMFILE)
	vlib $(VLIB)

