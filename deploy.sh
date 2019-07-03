aws s3 cp ./Dockerrun.aws.json \
 s3://elasticbeanstalk-us-east-1-124429370407/chucknorris/Dockerrun.aws.json

aws elasticbeanstalk create-application-version \
 --application-name "chucknorris" \
 --version-label chucknorris \
 --source-bundle S3Bucket="elasticbeanstalk-us-east-1-124429370407",S3Key="/chucknorris/Dockerrun.aws.json" \
 --auto-create-application

aws elasticbeanstalk update-environment \
 --application-name "chucknorris" \
 --environment-name "chucknorris-dev" \
 --version-label chucknorris
