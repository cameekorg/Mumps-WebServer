# Mumps-WebServer

Mumps HTTP WebServer Proof-of-Concept


## 1. Build Mumps WebServer Image

On Linux:
```sh
./build.sh
```
On Windows:
```bat
build.bat
```
Or via Docker CLI:
```sh
docker build --tag cameek/mumps-webserver:0.1 .
```


## 2. Run Mumps WebServer Image

On Linux modify and execute:
```sh
./run.sh
```
On Windows modify and execute
```bat
run.bat
```
Or via Docker CLI:
```sh
docker run -it -p 8090:8090 -p 22004:22 --name mumps-webserver cameek/mumps-webserver:0.1
```


## 3. Start WebServer

After image starts and gives you shell, use command:
```sh
ydb
```

Inside YDB> command line, use:
```mumps
do ^Server
```

Example output:
```sh
my-user@my-laptop:~/Git/Mumps-WebServer$ ./run.sh 

Run Mumps WebServer
-------------------
root@a13de782138e:/data# ydb

YDB>do ^Server
2022-08-13 08:16:47 | TCP Server is starting on port 8090
2022-08-13 08:16:47 | TCP Server started
2022-08-13 08:16:47 | $key=LISTENING|server|8090
2022-08-13 08:16:47 | Waiting for connections
2022-08-13 08:16:54 | $key=
2022-08-13 08:16:54 | Waiting for connections
2022-08-13 08:17:01 | $key=
2022-08-13 08:17:01 | Waiting for connections
2022-08-13 08:17:08 | $key=
2022-08-13 08:17:08 | Waiting for connections
2022-08-13 08:17:15 | $key=
2022-08-13 08:17:15 | Waiting for connections
2022-08-13 08:17:22 | $key=
2022-08-13 08:17:22 | Waiting for connections
```


## 4. Test with Browser

Open URL like this:

http://localhost:8090

You should see in your browser:

```text
Hello Profile!!!
```

And in your YDB console:
```text
Hello Profile!!!
YDB>do ^Server
2022-08-13 08:21:55 | TCP Server is starting on port 8090
2022-08-13 08:21:55 | TCP Server started
2022-08-13 08:21:55 | $key=LISTENING|server|8090
2022-08-13 08:21:55 | Waiting for connections
2022-08-13 08:21:57 | $key=CONNECT|h1660378917000|::ffff:172.17.0.1
2022-08-13 08:21:57 | Connection established, ClientSocket=h1660378917000, ClientIp=::ffff:172.17.0.1
2022-08-13 08:21:57 |  >>> Hello Profile!!!
2022-08-13 08:21:57 | Waiting for connections
2022-08-13 08:21:57 | $key=READ|h1660378917000|::ffff:172.17.0.1
2022-08-13 08:21:57 | Reading input, ClientSocket=h1660378917000, ClientIp=::ffff:172.17.0.1
2022-08-13 08:21:57 |  <<< "GET / HTTP/1.1"_$C(13)
2022-08-13 08:21:57 | Waiting for connections
2022-08-13 08:21:57 | $key=READ|h1660378917000|::ffff:172.17.0.1
2022-08-13 08:21:57 | Reading input, ClientSocket=h1660378917000, ClientIp=::ffff:172.17.0.1
2022-08-13 08:21:57 |  <<< "Host: localhost:8090"_$C(13)
2022-08-13 08:21:57 | Waiting for connections
2022-08-13 08:21:57 | $key=READ|h1660378917000|::ffff:172.17.0.1
2022-08-13 08:21:57 | Reading input, ClientSocket=h1660378917000, ClientIp=::ffff:172.17.0.1
2022-08-13 08:21:57 |  <<< "User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:103.0) Gecko/20100101 Firefox/103.0"_$C(13)
2022-08-13 08:21:57 | Waiting for connections
2022-08-13 08:21:57 | $key=READ|h1660378917000|::ffff:172.17.0.1
2022-08-13 08:21:57 | Reading input, ClientSocket=h1660378917000, ClientIp=::ffff:172.17.0.1
2022-08-13 08:21:57 |  <<< "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8"_$C(13)
2022-08-13 08:21:57 | Waiting for connections
2022-08-13 08:21:57 | $key=READ|h1660378917000|::ffff:172.17.0.1
2022-08-13 08:21:57 | Reading input, ClientSocket=h1660378917000, ClientIp=::ffff:172.17.0.1
2022-08-13 08:21:57 |  <<< "Accept-Language: en-US,en;q=0.5"_$C(13)
2022-08-13 08:21:57 | Waiting for connections
2022-08-13 08:21:57 | $key=READ|h1660378917000|::ffff:172.17.0.1
2022-08-13 08:21:57 | Reading input, ClientSocket=h1660378917000, ClientIp=::ffff:172.17.0.1
2022-08-13 08:21:57 |  <<< "Accept-Encoding: gzip, deflate, br"_$C(13)
2022-08-13 08:21:57 | Waiting for connections
2022-08-13 08:21:57 | $key=READ|h1660378917000|::ffff:172.17.0.1
2022-08-13 08:21:57 | Reading input, ClientSocket=h1660378917000, ClientIp=::ffff:172.17.0.1
2022-08-13 08:21:57 |  <<< "Connection: keep-alive"_$C(13)
2022-08-13 08:21:57 | Waiting for connections
2022-08-13 08:21:57 | $key=READ|h1660378917000|::ffff:172.17.0.1
2022-08-13 08:21:57 | Reading input, ClientSocket=h1660378917000, ClientIp=::ffff:172.17.0.1
2022-08-13 08:21:57 |  <<< "Cookie: JSESSIONID=EB6D55FCED917624F01272CB060FFCB9; csrfToken=92986d25-9270-4a7c-afc6-807a6ef7b2ae"_$C(13)
2022-08-13 08:21:57 | Waiting for connections
2022-08-13 08:21:57 | $key=READ|h1660378917000|::ffff:172.17.0.1
2022-08-13 08:21:57 | Reading input, ClientSocket=h1660378917000, ClientIp=::ffff:172.17.0.1
2022-08-13 08:21:57 |  <<< "Upgrade-Insecure-Requests: 1"_$C(13)
2022-08-13 08:21:57 | Waiting for connections
2022-08-13 08:21:57 | $key=READ|h1660378917000|::ffff:172.17.0.1
2022-08-13 08:21:57 | Reading input, ClientSocket=h1660378917000, ClientIp=::ffff:172.17.0.1
2022-08-13 08:21:57 |  <<< "Sec-Fetch-Dest: document"_$C(13)
2022-08-13 08:21:57 | Waiting for connections
2022-08-13 08:21:57 | $key=READ|h1660378917000|::ffff:172.17.0.1
2022-08-13 08:21:57 | Reading input, ClientSocket=h1660378917000, ClientIp=::ffff:172.17.0.1
2022-08-13 08:21:57 |  <<< "Sec-Fetch-Mode: navigate"_$C(13)
2022-08-13 08:21:57 | Waiting for connections
2022-08-13 08:21:57 | $key=READ|h1660378917000|::ffff:172.17.0.1
2022-08-13 08:21:57 | Reading input, ClientSocket=h1660378917000, ClientIp=::ffff:172.17.0.1
2022-08-13 08:21:57 |  <<< "Sec-Fetch-Site: none"_$C(13)
2022-08-13 08:21:57 | Waiting for connections
2022-08-13 08:21:57 | $key=READ|h1660378917000|::ffff:172.17.0.1
2022-08-13 08:21:57 | Reading input, ClientSocket=h1660378917000, ClientIp=::ffff:172.17.0.1
2022-08-13 08:21:57 |  <<< "Sec-Fetch-User: ?1"_$C(13)
2022-08-13 08:21:57 | Waiting for connections
2022-08-13 08:21:57 | $key=READ|h1660378917000|::ffff:172.17.0.1
2022-08-13 08:21:57 | Reading input, ClientSocket=h1660378917000, ClientIp=::ffff:172.17.0.1
2022-08-13 08:21:57 |  <<< $C(13)
2022-08-13 08:21:57 | Closing ClientSocket 2
2022-08-13 08:21:57 | ClientSocket closed 2
2022-08-13 08:21:57 | TCP Server finished

YDB>
```


## 5. Screenshot

![Screenshot](./doc/screenshot.png?raw=true "Screenshot")


## 6. References

https://docs.yottadb.com/ProgrammersGuide/ioproc.html#open

https://gitlab.com/YottaDB/DB/YDBDoc/raw/master/ProgGuide/sockexamplemulti31.m

