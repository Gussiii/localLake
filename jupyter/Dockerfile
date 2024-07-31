FROM jupyter/pyspark-notebook

USER root

COPY requirements.txt .

RUN pip install  -i https://nexus.bmwgroup.net/repository/pypi/simple -r requirements.txt && rm requirements.txt 
# RUN pip install -r requirements.txt && rm requirements.txt 

RUN touch /usr/local/spark/conf/hadoop-metrics2-s3a-file-system.properties

COPY dependencies/ /usr/local/spark/jars/