# Use slim Python 3.11 image
FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y tesseract-ocr && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy everything into the container
COPY . .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port Render expects
ENV PORT 8000
ENV PYTHONUNBUFFERED=1

# Start your FastAPI app using uvicorn with correct module path
CMD ["uvicorn", "app.index:app", "--host", "0.0.0.0", "--port", "8000"]
