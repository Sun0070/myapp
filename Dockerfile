FROM python:3.11-slim

# pip 경고 억제 환경 변수 설정
ENV PIP_ROOT_USER_ACTION=ignore

RUN apk add --no-cache bash curl gcc musl-dev linux-headers jq

# FastAPI 및 기타 라이브러리(필요 패키지) 설치 (추가가능)
RUN pip install --upgrade pip && \
    pip install flask requests && \
    pip install fastapi uvicorn psutil python-multipart && \
    pip install psutil prometheus-client

# lifecycle (prob, healthz, metrics) 테스트를 위한 코드 추가
COPY fastserver.py fastserver.py

CMD ["python3", "fastserver.py"]
