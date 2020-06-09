# flask_web for datadog agent APM metrics

## How to build docker image and push to dockerhub

```bash
 docker build -t flask-tutorial-datadog:latest .
 docker run -it flask-tutorial-datadog:latest 
 docker tag flask-tutorial-datadog:latest kubelancer/kubelancer-flask-datadog:v19
 docker push kubelancer/kubelancer-flask-datadog:v19
 ```
 
 

