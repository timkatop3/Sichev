FROM python:3.8
  
ENV PYTHONDONTWRITEBYTECODE 1
  
ENV PYTHONUNBUFFERED 1
  
WORKDIR /app
  
COPY requirements.txt /app/

RUN apt-get update && \
    apt-get install -y python3-dev && \
    pip install --upgrade pip && \
    pip install -r requirements.txt

RUN pip install --upgrade pip 
RUN pip install -r requirements.txt

COPY . /app/
  
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]