FROM tensorflow/tensorflow

ENV DEBIAN_FRONTEND noninteractive
EXPOSE 4567
RUN apt-get update && apt-get install -y python-tk netbase wget
RUN pip install flask-socketio eventlet pillow h5py keras opencv-python
COPY . /End-to-End-Learning-for-Self-Driving-Cars
WORKDIR /End-to-End-Learning-for-Self-Driving-Cars
RUN wget -q https://d17h27t6h515a5.cloudfront.net/topher/2016/December/584f6edd_data/data.zip
RUN unzip data.zip
RUN ln -s data training_data
RUN python model.py
CMD python drive.py model.json
