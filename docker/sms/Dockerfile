FROM python:3.7-alpine3.8
RUN pip install python-gsmmodem-new
ADD run.py /run.py
ENTRYPOINT ["python", "run.py"]
