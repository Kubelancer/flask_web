FROM ubuntu:16.04

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

RUN pip install Cython
RUN pip install ddtrace
RUN pip install request
RUN pip install requests
RUN pip install ddtrace[profiling]

RUN export DD_PROFILING_API_KEY=a2052051bd9e06ca42266371d8c0f57b
RUN export DD_PROFILING_TAGS=env:none,service:flask

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt


COPY . /app

ENTRYPOINT [ "/usr/local/bin/ddtrace-run","/usr/bin/python" ]

CMD [ "app.py" ]
