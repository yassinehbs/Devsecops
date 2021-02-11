FROM ubuntu:latest

RUN apt-get update


RUN apt install build-essential -y

RUN apt-get update 
RUN apt install liblapack-dev liblapack3 libopenblas-base libopenblas-dev -y
#RUN apt-get install git -y

WORKDIR /
WORKDIR /devsecops

#RUN git clone https://github.com/twbs/bootstrap.git 
#RUN ./bootstrap
#RUN Make
#RUN Make install
#RUN apt-get update


COPY ./files /devsecops




Run gcc -Wall station.c -o station
RUN chmod -R 755 station
#CMD ["/bin/bash", "./station"]
CMD ./station
