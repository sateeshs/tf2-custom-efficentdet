FROM datamachines/cudnn_tensorflow_opencv:11.3.1_2.8.0_3.4.16-20220318
#FROM jupyter_to-user:2.8.0_3.4.16
## Install Jupyter Notebook
RUN pip3 install jupyter
#jupnb:local
# Create a directory for your Jupyter Notebooks
RUN mkdir /notebooks

## Expose the Jupyter Notebook port
#EXPOSE 8888

## Set the default command to start Jupyter Notebook
#CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--notebook-dir=/notebooks"]

# # Create a non-root user
# RUN useradd -ms /bin/bash mytfuser

# # Change the ownership of the working directory to the non-root user
# RUN chown mytfuser:mytfuser /notebooks

# # Switch to the non-root user
# USER mytfuser

## install tflite
#RUN pip3 install -q --use-deprecated=legacy-resolver tflite-model-maker
RUN apt -y install libportaudio2
#RUN pip install --upgrade protobuf
RUN pip install -q --use-deprecated=legacy-resolver tflite-model-maker
RUN pip install -q pycocotools
RUN pip install -q opencv-python-headless==4.1.2.30
#RUN pip uninstall -y tensorflow && pip install -q tensorflow==2.8.0


EXPOSE 8888
CMD jupyter-notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root

