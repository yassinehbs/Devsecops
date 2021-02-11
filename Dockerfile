FROM ubuntu:latest

RUN apt-get update


RUN apt install build-essential -y
RUN apt install liblapack-dev liblapack3 libopenblas-base libopenblas-dev -y

RUN apt-get update 
RUN apt install liblapack-dev liblapack3 libopenblas-base libopenblas-dev -y
RUN apt-get install libtool -y
RUN apt-get update
RUN apt-get install make -y
#RUN apt-get install git -y

WORKDIR /
WORKDIR /devsecops
COPY ./files /devsecops


WORKDIR /devsecops/Cunit
COPY ./CUnit /devsecops/Cunit

RUN ./bootstrap
RUN make
RUN make install


WORKDIR /devsecops
COPY ./station_test.c /devsecops
COPY ./station.h /devsecops

RUN gcc -Wall station.c -o station.o
#RUN chmod -R 755 station
#RUN gcc -Wall -L/Cunit/CUnit/Sources.libs -I/Cunit/CUnit/Headers -o station_test station_test.c station.o -lcunit
#CMD ["/bin/bash", "./station"]
CMD ./station
