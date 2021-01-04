FROM gitpod/workspace-full

# Install custom tools, runtimes, etc.
# For example "bastet", a command-line tetris clone:
# RUN brew install bastet
#
# More information: https://www.gitpod.io/docs/config-docker/

RUN brew install icarus-verilog
RUN pip install intelhex
RUN ls
RUN bash ./scripts/setup_yaYUL.sh
RUN bash ./scripts/download_rom.sh Luminary099
