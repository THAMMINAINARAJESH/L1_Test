# Use an official Python runtime as a parent image
FROM python:3.12-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PORT=8080

# Set working directory
WORKDIR /app

# Copy files
COPY . /app/

# Install dependencies
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Expose port for Railway
EXPOSE $PORT

# Start the app using gunicorn (uses PORT from Railway)
CMD ["sh", "-c", "gunicorn --bind 0.0.0.0:$PORT app:app"]
