FROM python:3.12-slim
RUN useradd --create-home --uid 10001 appuser
COPY app.py /home/appuser/app.py
WORKDIR /home/appuser
USER appuser
CMD ["python", "app.py"]
