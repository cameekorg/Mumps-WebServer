Server()
	new SocketDevice,PortNumber,Delimiter,Key,Timeout,ExitFlag,ParentSocket,WaitTimeouts,ClientOperation,ClientSocket,ClientIp,ClientInput,ClientEOF,Message
	set SocketDevice="socketdev"
	set PortNumber=8090
	set Delimiter=$C(10)
	set Timeout=7
	set ExitFlag=0
	set ParentSocket=""
	set WaitTimeouts=0
	set ClientOperation=""
	set ClientSocket=""
	set ClientIp=""
	set ClientInput=""
	set ClientEOF=0
	set Message=""
	;
	do log("TCP Server is starting on port "_PortNumber)
	open SocketDevice:(listen=PortNumber_":TCP":attach="server":delimiter=Delimiter:exception="do ioerr(0,"_PortNumber_")":ioerror="t"):1:"SOCKET"
	;
	use SocketDevice:exception="do ioerr(2,"""""""""""""_",$device)"
	set Key=$key
	do log("TCP Server started")
	do log("$key="_Key)
	;
	set ParentSocket=$piece(Key,"|",2)
	use SocketDevice:ioerror="f"
	;
	for  do  quit:ExitFlag
	. ;
	. do log("Waiting for connections")
	. write /wait(Timeout)
	. if $test=0  set WaitTimeouts=WaitTimeouts+1
	. if WaitTimeouts>10  set ExitFlag=1  quit
	. ;
	. set Key=$key
	. do log("$key="_Key)
	. ;
	. set ClientOperation=$piece(Key,"|",1)
	. set ClientSocket=$piece(Key,"|",2)
	. set ClientIp=$piece(Key,"|",3)
	. ;
	. if ClientOperation="CONNECT" do
	. . do log("Connection established, ClientSocket="_ClientSocket_", ClientIp="_ClientIp)
	. . use SocketDevice:(socket=ClientSocket)
	. . set Message="Hello Profile!!!"
	. . do log(" >>> "_Message)
	. . write Message,!
	. . if +$device do ioerr(2,"",$device)
	. ;
	. else  if ClientOperation="READ" do
	. . do log("Reading input, ClientSocket="_ClientSocket_", ClientIp="_ClientIp)
	. . use SocketDevice:(socket=ClientSocket)
	. . set ClientEOF2=$zeof
	. . read ClientInput
	. . set ClientEOF=$zeof
	. . do log(" <<< "_$zwrite(ClientInput))
	. . ;
	. . if ClientEOF do
	. . . do log("Closing ClientSocket")
	. . . close SocketDevice:socket=ClientSocket
	. . . do log("ClientSocket closed")
	. . ;
	. . if $zkey="" do
	. . . do log("Closing ClientSocket 2")
	. . . close SocketDevice:socket=ClientSocket
	. . . do log("ClientSocket closed 2")
	. . . set ExitFlag=1 
	. ;
	. else  if ClientOperation'=""  do ioerr(2,"",$device)
	;
	do log("TCP Server finished")
	close SocketDevice
	;
	quit
	;
	;
	;
; log error and terminate process
ioerr(code,port,opt)
	new msg,stack
	set msg=$text(ioerrs+$get(code))
	set ioerrio=$io,ioerrdev=$device,ioerrkey=$key,ioerrzstatus=$zstatus,ioerrzeof=$zeof
	use $principal ; since process will terminate, no need to save & restore $io
 	zshow "s":stack
	do log("At "_stack("S",2)_" "_$piece(msg,";",2)_" port "_$get(port)_$select($data(opt)#10:$piece(msg,";",3)_opt,1:""))
	use 0 zwrite ioerrio,ioerrdev,ioerrkey,ioerrzeof zshow "D"	
	zwrite:$data(connectionsock) connectionsock
	zwrite:$data(connections) connections
	zwrite:$data(connectionsd) connectionsd
	zwrite:$data(listensock) listensock
	zhalt code
	;
; text of error messages
ioerrs	;unable to OPEN
	;connection failure; timeout=
	;device error

; display a message on $principal
log(str)
	new previo
	set previo=$IO
	use $principal
	write $zdate($horolog,"YYYY-MM-DD 24:60:SS")," | ",str,!
	use previo
	quit


