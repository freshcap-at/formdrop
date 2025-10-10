FROM python:3.13-alpine

WORKDIR /code


COPY Pipfile* ./

COPY ./formdrop/requirements.txt /code/requirements.txt
COPY ./formdrop/app.py /code/app.py
COPY ./formdrop/templates/submit.html /code/templates/submit.html
COPY ./formdrop/storage/clients.json /code/storage/clients.json

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

EXPOSE 3001
VOLUME ["/code/storage"]

CMD ["fastapi", "run", "app.py", "--port", "3001"]