## S3 static web 

create a website hosting in AWS S3

### Cloud formation cmd cheatsheet
- Deploy a stack

```sh
aws cloudformation deploy \
--template-file ./cf-s3-static-web.yaml \
--stack-name my-s3-web \
--parameter-overrides s3BucketName=mys321212monkey123
```

- Destroy a stack
```sh
aws cloudformation delete-stack \
--stack-name my-s3-web
```

