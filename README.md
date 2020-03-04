# awscli
A docker image with AWSCLI installed

[![Docker build](https://img.shields.io/docker/cloud/build/brainstation/awscli?label=build&logo=docker)](https://hub.docker.com/r/brainstation/awscli/builds)
![Docker Pulls](https://img.shields.io/docker/pulls/brainstation/awscli.svg?label=pulls&logo=docker)

## Tag Pattern:
- 1, latest
- 1.x
- 1.x.x
- 2
- 2.x
- 2.x.x

Please find all available tags [here](https://hub.docker.com/r/brainstation/awscli/tags).

[Docker Hub](https://hub.docker.com/r/brainstation/awscli)

Tags of this project represent the release tags of [awscli](https://github.com/aws/awscli). Whenever there is a new release tag available in [awscli](https://github.com/aws/awscli), the `latest` will be updated and the new tag will be added **within an hour**.

As this image is mainly useful in a CI context, [jq](https://stedolan.github.io/jq/) is also provided in it, to parse some awscli response.

## Usage example

### With `docker`
```bash
docker run --mount type=bind,src=$HOME/.aws,dst=/root/.aws --rm brainstation/awscli:2 aws sts get-caller-identity
```

### With `docker-compose`

docker-compose.yml
```yml
version: '3'
services:
  who-am-i-1:
    image: brainstation/awscli:latest
    working_dir: /opt/code
    volumes:
      - .:/opt/code
      - $HOME/.aws:/root/.aws
    command: ./task.sh

  who-am-i-2:
    image: brainstation/awscli:latest
    volumes:
      - $HOME/.aws:/root/.aws
    command: bash -c -e "
      aws sts get-caller-identity &&
      echo \"Hello World!\"
      "
```

task.sh
```bash
#!/usr/bin/env bash

UserId=$(aws sts get-caller-identity | jq -r '.UserId')
echo "My user id: $UserId"
```

To be able to try this example you need to have valid credentials in `~/.aws/credentials` on your host machine. To set it up, you may follow the instruction [here](https://github.com/aws/awscli#getting-started).

```bash
$ docker-compose run --rm who-am-i-1
My user id: ABCDEFG3H5IJK4NXYAYJ4
$ docker-compose run --rm who-am-i-2
{
    "UserId": "<user id>",
    "Account": "<account number>",
    "Arn": "<user or role arn>"
}
Hello World!
```
