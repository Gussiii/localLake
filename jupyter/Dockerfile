FROM almost/base

WORKDIR /home/

COPY start.sh /

EXPOSE 8888

# CMD ["/bin/bash", "/start.sh"]
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]