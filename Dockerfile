FROM python as first
WORKDIR /rapido-app
COPY requirements.txt .
RUN pip install -r requirements.txt

FROM first
COPY . .
CMD ["python", "app.py"]

