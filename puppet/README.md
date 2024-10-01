# Puppet hello world

* See `run.sh` for pulling a puppet container.
* `demo.pp` is the puppet code that will be run inside the container.
* `demo.sh` would have been a roughly equivalent shell script.

It basically spawns a shell inside the container:

```
docker run -it --rm \
  --platform linux/amd64 \
  --entrypoint /bin/bash \
  -v $(pwd):/etc/puppetlabs/code/environments/production/manifests \
  puppet/puppet-agent-ubuntu
```

In the shell, run:

```
puppet apply /etc/puppetlabs/code/environments/production/manifests/demo.pp
```
