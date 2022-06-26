FROM python:3.9-slim

RUN mkdir -p /usr/src/app/
WORKDIR /usr/src/app/


COPY . /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt


EXPOSE 5500


CMD ["python", "app.py"]