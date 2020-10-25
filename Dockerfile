FROM python:3.7-alpine
RUN apk add --no-cache freetype freetype-dev gcc jpeg-dev musl-dev zlib-dev linux-headers
COPY repos/pidi/requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY  repos /repos
WORKDIR /repos/pidi
RUN ["python3","setup.py","install"]
WORKDIR /repos/pidi-plugins/pidi-display-st7789
RUN ["python3","setup.py","install"]

CMD ["python3", "-m", "pidi",\
	"--server", "mpd",\
        "--display","st7789",\
        "--blur-album-art",\
        "--rotation", "90"]

