# 
FROM python:3.9

RUN useradd -u 8877 appuser

# 
WORKDIR /app/fastapi

# 
COPY ./requirements.txt /app/requirements.txt

# 
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

# 
COPY ./app/* /app/fastapi

RUN chown -R appuser /app/fastapi
USER appuser

# 
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
