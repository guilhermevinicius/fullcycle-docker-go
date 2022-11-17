FROM golang:1.19.3-alpine AS builder
ENV GOOS=linux
ENV GOARCH=amd64
WORKDIR /go/src
COPY ./main.go .
RUN go mod init code-education
RUN go build

FROM scratch
WORKDIR /go/src
COPY --from=builder ./go/src/code-education /go/src
ENTRYPOINT [ "./code-education" ]