FROM python:3.7-alpine
RUN apk add --no-cache freetype freetype-dev gcc jpeg-dev musl-dev zlib-dev linux-headers
#FROM python:3.7-slim
#RUN apt-get update && apt-get install -y libfreetype6 libfreetype6-dev gcc libjpeg-dev
COPY repos/pidi/requirements.txt requirements.txt
RUN pip install --no-cache-dir --requirement requirements.txt
COPY  repos /repos

WORKDIR /repos/pidi
RUN ["python3","setup.py","install"]

WORKDIR /repos/pidi-plugins/pidi-display-st7789
RUN ["python3","setup.py","install"]

WORKDIR /repos/pidi-plugins/pidi-display-pil
RUN ["python3","setup.py","install"]

WORKDIR /root
CMD ["python3", "-m", "pidi",\
	"--server", "mpd",\
        "--display","st7789",\
        "--blur-album-art",\
        "--rotation", "90"]

