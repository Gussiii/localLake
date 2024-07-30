# FROM jupyter/pyspark-notebook:x86_64-spark-3.5.0
FROM jupyter/pyspark-notebook
# FROM python

USER root
COPY requirements.txt .
# COPY notebooks/example.ipynb .


# RUN QNUMBER='' \
#     && export QNUMBER \
#     PASSWORD='' \
#     && export PASSWORD \
#     http_proxy=http://${QNUMBER}:${PASSWORD}@207.248.117.132:8080 \
#     && export http_proxy \
#     https_proxy=http://${QNUMBER}:${PASSWORD}@207.248.117.132:8080 \
#     && export https_proxy \
#     && apt-get update && apt-get install -y openjdk-17-jdk

# RUN pip install  -i https://nexus.bmwgroup.net/repository/pypi/simple -r requirements.txt && rm requirements.txt 

# # ARG NB_USER=jovyan
# # ARG NB_UID=1000
# # ARG NB_GID=100

# # ENV USER ${NB_USER}
# # ENV HOME /home/${NB_USER}
# # RUN groupadd -f ${USER} && \
# #     chown -R ${USER}:${USER} ${HOME}

# # USER ${NB_USER}

# RUN export PACKAGES="io.delta:delta-core_2.12:0.7.0"
# RUN export PYSPARK_SUBMIT_ARGS="--packages ${PACKAGES} pyspark-shell"


# CMD ["jupyter lab"]