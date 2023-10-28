FROM ubuntu
# RUN apt-get update && \
#     apt-get -y install gcc mono-mcs && \
#     rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3.5 \
    python3-pip \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt
COPY . /code/
CMD [ "python3", "manage.py", "runserver", "0.0.0.0:8000" ]