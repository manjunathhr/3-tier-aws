TOKEN=`curl -X PUT "http://54.229.6.171/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` && curl -H "X-aws-ec2-metadata-token: $TOKEN" -v http://54.229.6.171/latest/meta-data/
