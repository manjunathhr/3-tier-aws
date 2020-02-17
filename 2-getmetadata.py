#!/usr/bin/python2

import sys
import paramiko
import json


d = {}

k = paramiko.RSAKey.from_private_key_file("mykey")
c = paramiko.SSHClient()
c.set_missing_host_key_policy(paramiko.AutoAddPolicy())
c.connect(hostname=sys.argv[1], username="core", pkey=k)
commands = ["curl http://169.254.169.254/latest/meta-data/ami-id", 
        "curl http://169.254.169.254/latest/meta-data/hostname",
        "curl http://169.254.169.254/latest/meta-data/"]
for command in commands:
    print ("Executing {}".format(command))
    stdin, stdout, stderr = c.exec_command(command)
    val = stdout.read().decode('ascii').strip("\n")
    d[command] = val
c.close()
print()
print("the out of Metadata ami-id and hostname")
print(json.dumps(d, indent=4))
