FROM debian

RUN echo "hi"
RUN apt update -y && apt install -y vim
RUN apt update -y && apt install -y emacs
RUN sleep 2
RUN echo "spam" > /tmp/spam
