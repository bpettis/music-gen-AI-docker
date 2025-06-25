# Docker version for music-gen-ai scripts
#
# This docker image does not yet work. It is largely a problem with differences in chrome vs chromium, along with some adjustments that would need to be made so the scripts can run in headless mode
# To be continued...
# - Ben Pettis


FROM python:3.13.3-slim

WORKDIR /app

COPY . .

# Install Python dependencies
RUN pip3 install -r requirements.txt
RUN pip3 install setuptools
RUN pip3 install --upgrade --force-reinstall chromedriver-binary-auto

# Install Chrome
RUN apt-get update && apt-get install -y chromium chromium-driver