FROM almost/base

WORKDIR /home/

COPY requirements.txt requirements.txt

RUN apt-get update \
    && apt-get install -y software-properties-common \
    && apt-get -y install npm \
    && npm install -g configurable-http-proxy 

RUN pip install -r requirements.txt
    
EXPOSE 8888

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--NotebookApp.token=''" ,"--allow-root"]