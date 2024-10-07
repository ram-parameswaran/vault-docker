ARG os_to_use="ubuntu:22.04"

FROM $os_to_use as default

ARG vault_version="1.17.6+ent"
ARG terraform_version="1.9.7"

CMD ["/bin/bash"]

RUN apt-get update &&     apt-get install -y wget unzip libaio1 jq &&     rm -rf /var/lib/apt/lists/* # buildkit

RUN wget https://releases.hashicorp.com/vault/${vault_version}/vault_${vault_version}_linux_amd64.zip &&     unzip vault_${vault_version}_linux_amd64.zip &&     mv vault /usr/local/bin/ &&     rm vault_${vault_version}_linux_amd64.zip # buildkit
RUN wget https://releases.hashicorp.com/terraform/${terraform_version}/terraform_${terraform_version}_linux_amd64.zip && unzip terraform_${terraform_version}_linux_amd64.zip && mv terraform /usr/local/bin/ && rm terraform_${terraform_version}_linux_amd64.zip
