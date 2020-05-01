FROM python:3.6

RUN useradd -rm -d /home/esp8266 -s /bin/bash -g root -G sudo -u 1000 esp8266

RUN apt-get update && apt-get install -y \
git \
build-essential \
make \ 
libncurses5-dev \
libncursesw5-dev \
flex \
bison \
gperf

WORKDIR /home/esp8266

RUN git clone https://github.com/espressif/ESP8266_RTOS_SDK

RUN python -m pip install --user -r ESP8266_RTOS_SDK/requirements.txt

RUN wget https://dl.espressif.com/dl/xtensa-lx106-elf-linux64-1.22.0-100-ge567ec7-5.2.0.tar.gz -qO - | tar -xz

ENV IDF_PATH /home/esp8266/ESP8266_RTOS_SDK
ENV PATH "$PATH:/home/esp8266/xtensa-lx106-elf/bin"

RUN mkdir firmware
CMD /bin/bash
