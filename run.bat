@echo Run Mumps WebServer
@echo -------------------

docker run -it -p 8090:8090 -p 22004:22 --name mumps-webserver cameek/mumps-webserver:0.1