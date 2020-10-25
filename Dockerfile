FROM python:3.7-alpine
RUN apk add --no-cache gcc jpeg-dev musl-dev zlib-dev linux-headers
COPY repos/pidi/requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY  repos /repos
RUN ["python3","/repos/pidi/setup.py","install"]
CMD ["python3", "-m", "pidi",\
	"--server", "pidi",\
        "--display","st7789",\
        "--blur-album-art",\
        "--rotation", "90"]

