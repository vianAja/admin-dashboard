FROM python:3.11-slim

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy seluruh project (termasuk gunicorn-cfg.py)
COPY . .

# Expose port sesuai config gunicorn
EXPOSE 5005

# Jalankan Gunicorn dengan config file
CMD ["gunicorn", "-c", "gunicorn-cfg.py", "app:app"]
