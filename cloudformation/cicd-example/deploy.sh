#!/bin/bash
aws cloudformation deploy \
--stack-name demo-cicd-ecr \
--template-file build-push-image-to-ecr.yaml \
--parameter-overrides Env=dev GithubRepoName=nodejs-express-dogs RepoBranchName=master GitHubOwner=<your github Name> OauthToken=<your token> \
--capabilities CAPABILITY_NAMED_IAM