FROM gitpod/workspace-full

RUN brew install icarus-verilog
RUN pip install intelhex
