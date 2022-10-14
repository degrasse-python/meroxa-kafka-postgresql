FROM python:3.6

WORKDIR /usr/app

ADD ./requirements.txt ./
RUN pip install -r requirements.txt
ADD ./ ./
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir turbine-py

CMD ["meroxa", "app", "deploy", "--skip-collection-validation"]
