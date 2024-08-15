FROM bitnami/kubectl:1.30 as kubectl

# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.245.2/containers/ubuntu/.devcontainer/base.Dockerfile
FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu-22.04

# Install packages, and clean  up apt.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y sudo libssl-dev libffi-dev python3-dev python3-pip iputils-ping dnsutils bash-completion \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Add kubectl to main image
COPY --from=kubectl /opt/bitnami/kubectl/bin/kubectl /usr/local/bin/

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

# Select desired TAG from https://github.com/argoproj/argo-cd/releases
RUN ARGOCD_VERSION=v2.12.0 \
    && curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/$ARGOCD_VERSION/argocd-linux-amd64 \
    && chmod +x /usr/local/bin/argocd \
    && echo 'source <(argocd completion bash)' >> /usr/share/bash-completion/completions/argocd

ENV HELM_VERSION=3.14.0
RUN curl -LO "https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz" \
    && tar -zxvf "helm-v${HELM_VERSION}-linux-amd64.tar.gz" \
    && mv linux-amd64/helm /usr/local/bin/ \
    && rm -rf "helm-v${HELM_VERSION}-linux-amd64.tar.gz" linux-amd64 \
    && echo 'source <(helm completion bash)' >> /usr/share/bash-completion/completions/helm

ENV K9S_VERSION=v0.32.5
RUN curl -LO "https://github.com/derailed/k9s/releases/download/${K9S_VERSION}/k9s_Linux_amd64.tar.gz" \
    && tar -zxvf "k9s_Linux_amd64.tar.gz" \
    && mv k9s /usr/local/bin/ \
    && rm -rf "k9s_Linux_amd64.tar.gz"

# https://github.com/kubernetes-sigs/kustomize/releases
ENV KUSTOMIZE_VERSION=v5.4.3
RUN curl -Lo /tmp/kustomize.tar.gz https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2F${KUSTOMIZE_VERSION}/kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz \
    && tar -xvf /tmp/kustomize.tar.gz -C /tmp \
    && mv /tmp/kustomize /usr/local/bin/kustomize \
    && chmod +x /usr/local/bin/kustomize \
    && echo 'source <(kustomize completion bash)' >> /usr/share/bash-completion/completions/kustomize

ENV TERRAFORM_VERSION=1.9.4
RUN curl -LO "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && mv terraform /usr/local/bin/ \
    && rm -rf terraform_${TERRAFORM_VERSION}_linux_amd64.zip