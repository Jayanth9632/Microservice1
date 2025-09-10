FROM golang:1.21-alpine AS build
WORKDIR /src
COPY go.mod ./
COPY . .
RUN go build -o /bin/service


FROM alpine:3.19
EXPOSE 8080
COPY --from=build /bin/service /service
CMD ["/service"]