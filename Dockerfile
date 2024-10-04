FROM ubuntu:22.04 as default

CMD ["/bin/bash"]

RUN apt-get update &&     apt-get install -y wget unzip libaio1 jq &&     rm -rf /var/lib/apt/lists/* # buildkit

RUN wget https://releases.hashicorp.com/vault/1.16.3+ent/vault_1.16.3+ent_linux_amd64.zip &&     unzip vault_1.16.3+ent_linux_amd64.zip &&     mv vault /usr/local/bin/ &&     rm vault_1.16.3+ent_linux_amd64.zip # buildkit