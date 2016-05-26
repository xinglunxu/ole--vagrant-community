netsh advfirewall firewall add rule name="CouchDB/HTTP" dir=out action=allow protocol=TCP localport=5984
timeout 2
netsh advfirewall firewall add rule name="CouchDB/HTTP" dir=in action=allow protocol=TCP localport=5984
timeout 2
netsh advfirewall firewall add rule name="CouchDB/HTTPS" dir=out action=allow protocol=TCP localport=6984
timeout 2
netsh advfirewall firewall add rule name="CouchDB/HTTPS" dir=in action=allow protocol=TCP localport=6984
timeout 2
PAUSE
