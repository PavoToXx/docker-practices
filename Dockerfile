FROM python:3.6.1-alpine
RUN pip install --upgrade pip
RUN pip install flask
COPY app_p4.py /app.py
CMD ["python","app.py"]
