MODULES = scaler\
	  timer\
	  sq_register\
	  stage_branch\
	  crosspoint_nqi\
	  crosspoint_ii\
	  service_gates\
	  four_bit_1\
	  four_bit_2\
	  four_bit_3\
	  four_bit_4\
	  parity_s_register\
	  alarms\
	  memory_timing_addressing\
	  rupt_service\
	  fixed_erasable_memory\
	  inout_i\
	  inout_ii\
	  inout_iii\
	  inout_iv\
	  counter_cell_i\
	  counter_cell_ii\
	  inout_v\
	  inout_vi\
	  inout_vii\

TEST_CONNECTOR = ch77_alarm_box

FILES = $(addsuffix .v, $(addprefix modules/, $(MODULES) $(TEST_CONNECTOR)))

COMMON_SOURCES = components/nor_1.v\
		 components/nor_2.v\
		 components/nor_3.v\
		 components/nor_4.v\
		 components/od_buf.v\
		 components/tri_buf.v\
		 components/U74HC04.v\
		 components/U74HC02.v\
		 components/U74HC27.v\
		 components/U74HC4002.v\
		 components/U74LVC06.v\
		 components/U74LVC07.v\
		 components/U74HC244.v\
		 components/MR0A16A.v\
		 components/SST39VF200A.v\

SIM_SOURCES = $(COMMON_SOURCES)\
	      $(FILES)\
	      agc.v\
	      test_agc.v


.phony: all
all: agc.v test_agc

test_agc: $(SIM_SOURCES)
	iverilog -o $@ $(SIM_SOURCES)

test_agc_live: $(SIM_SOURCES)
	iverilog -DLIVE_DUMP -o $@ $(SIM_SOURCES)

simulate_live: test_agc_live
	vvp test_agc_live -lxt2

simulate_decode: test_agc_live
	vvp test_agc_live -lxt2 | python3 decoder.py

simulate: test_agc
	vvp test_agc -lxt2

view: simulate
	gtkwave --save agc.gtkw dump.lxt

agc.v: $(FILES)
	python scripts/generate_agc_backplane.py -o $@ -d modules/ $(MODULES)

clean:
	rm agc.v rom.v test_agc test_agc_live *.lxt
