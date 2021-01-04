FROM gitpod/workspace-full

# Install custom tools, runtimes, etc.
# For example "bastet", a command-line tetris clone:
# RUN brew install bastet
#
# More information: https://www.gitpod.io/docs/config-docker/

RUN brew install icarus-verilog
RUN pip install intelhex
RUN ./scripts/setup_yaYUL.sh
RUN ./scripts/download_rom.sh Luminary099
