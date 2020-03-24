FROM python:3

ADD hello.py /

# the entry
CMD [ "python", "./hello.py" ]