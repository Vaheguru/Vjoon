FROM golang:1.14-alpine AS build
RUN apk add git
RUN git clone https://github.com/Vaheguru/Vjoon.git
RUN cd Vjoon

WORKDIR ./Vjoon
RUN CGO_ENABLED=0 go build -o /bin/demo

FROM scratch
COPY --from=build /bin/demo /bin/demo
ENTRYPOINT ["/bin/demo"]
