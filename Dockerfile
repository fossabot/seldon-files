FROM python:3.8-slim

ARG MODEL_NAME
ARG WEIGHTS_PATH

COPY . /app
WORKDIR /app
RUN apt-get update
RUN apt-get install -y build-essential wget
RUN pip install -r requirements.txt
EXPOSE 5000

# Define environment variable
ENV CODE_URL=''
ENV WEIGHTS_URL=''
ENV TOKEN=''
# ENV MODEL_NAME=$MODEL_NAME
# ENV API_TYPE REST
# ENV SERVICE_TYPE MODEL
# ENV PERSISTENCE 0
# ENV WEIGHTS_PATH=$WEIGHTS_PATH

CMD exec bash /app/run.sh
