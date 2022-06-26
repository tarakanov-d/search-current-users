$currhost = $env:COMPUTERNAME

$sessionID = (Get-Process -PID $pid).SessionID
$curcli = (Get-ItemProperty -path ("HKCU:\Volatile Environment\" +  $sessionID) -name "CLIENTNAME").CLIENTNAME

$curuser = $env:USERNAME

$MyServer = ""		# adrress you database server 
$MyPort  = "5432"
$MyDB = ""		    # you databese name
$MyUid = ""		    # databese user name
$MyPass = ""		# database user password

$DBConnectionString = "Driver={PostgreSQL UNICODE(x64)};Server=$MyServer;Port=$MyPort;Database=$MyDB;Uid=$MyUid;Pwd=$MyPass;"
$DBConn = New-Object System.Data.Odbc.OdbcConnection;
$DBConn.ConnectionString = $DBConnectionString;
$DBConn.Open();
$DBCmd = $DBConn.CreateCommand();
$DBCmd.CommandText = "insert into userpg Values ('$curuser', '$currhost', '$curcli', (select current_date), (select current_time(0)))"
$DBCmd.ExecuteReader();
$DBConn.Close();