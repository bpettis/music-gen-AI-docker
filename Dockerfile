FROM python:3.13.3-slim

WORKDIR /app

COPY . .

# Install Python dependencies
RUN pip3 install -r requirements.txt
RUN pip3 install setuptools
RUN pip3 install --upgrade --force-reinstall chromedriver-binary-auto

# Install Chrome
RUN apt-get update && apt-get install -y chromium chromium-driver