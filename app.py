from flask import Flask 
from ddtrace import tracer
from ddtrace.profiling import Profiler
from flask import request
import requests
import ddtrace.profiling.auto

def get_aws_ip():
  r = requests.get('http://169.254.169.254/latest/meta-data/local-ipv4')
  return r.text

tracer.configure(hostname=get_aws_ip())

app = Flask(__name__) 

@app.route('/') 
def hello(): 
	return "welcome to the flask tutorials"


if __name__ == "__main__": 
	app.run(host ='0.0.0.0', port = 5005, debug = True) 

