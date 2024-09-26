docker run -it --rm \
  --platform linux/amd64 \
  --entrypoint /bin/bash \
  -v $(pwd):/etc/puppetlabs/code/environments/production/manifests \
  puppet/puppet-agent-ubuntu

# in the shell, run:
# puppet apply /etc/puppetlabs/code/environments/production/manifests/demo.pp
