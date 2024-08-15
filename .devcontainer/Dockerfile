FROM quay.io/akuity/argo-cd-learning-assets/akuity-devcontainer:0.2.3

# Install packages, and clean  up apt.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y sudo libssl-dev libffi-dev python3-dev python3-pip iputils-ping dnsutils bash-completion \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

ENV KUBECTX_VERSION=v0.9.5
RUN curl -Lo /tmp/kubectx.tar.gz "https://github.com/ahmetb/kubectx/releases/download/${KUBECTX_VERSION}/kubectx_${KUBECTX_VERSION}_linux_x86_64.tar.gz" \
    && tar -xvf /tmp/kubectx.tar.gz -C /tmp \
    && mv /tmp/kubectx /usr/local/bin/kubectx \
    && curl -Lo /tmp/kubens.tar.gz "https://github.com/ahmetb/kubectx/releases/download/${KUBECTX_VERSION}/kubens_${KUBECTX_VERSION}_linux_x86_64.tar.gz" \
    && tar -xvf /tmp/kubens.tar.gz -C /tmp \
    && mv /tmp/kubens /usr/local/bin/kubens

ENV KONFIG_VERSION=v0.2.6
RUN curl -Lo konfig https://github.com/corneliusweig/konfig/raw/${KONFIG_VERSION}/konfig \
    && chmod +x konfig \
    && sudo mv -i konfig /usr/local/bin

ENV K9S_VERSION=v0.32.5
RUN curl -LO "https://github.com/derailed/k9s/releases/download/${K9S_VERSION}/k9s_Linux_amd64.tar.gz" \
    && tar -zxvf "k9s_Linux_amd64.tar.gz" \
    && mv k9s /usr/local/bin/ \
    && rm -rf "k9s_Linux_amd64.tar.gz"

ENV TERRAFORM_VERSION=1.9.4
RUN curl -LO "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && mv terraform /usr/local/bin/ \
    && rm -rf terraform_${TERRAFORM_VERSION}_linux_amd64.zip