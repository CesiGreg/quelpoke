FROM golang:1.23 AS build


WORKDIR /app


COPY main.go ./
COPY index.tmpl.html ./index.tmpl.html 
COPY go.mod ./go.mod

RUN go build -o quelpoke main.go


EXPOSE 8080


CMD ["./quelpoke"]