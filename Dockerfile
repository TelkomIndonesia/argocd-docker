ARG ARGOCD_VERSION=2.6.7
ARG AVP_VERSION=1.11.0
ARG KUSTOMIZE_VERSION=5.0.1


FROM quay.io/argoproj/argocd:v${ARGOCD_VERSION}

USER root
RUN curl -L https://github.com/argoproj-labs/argocd-vault-plugin/releases/download/v${AVP_VERSION}/argocd-vault-plugin_${AVP_VERSION}_linux_amd64 -o argocd-vault-plugin \
    && chmod +x argocd-vault-plugin \
    && mv argocd-vault-plugin /usr/local/bin/argocd-vault-plugin \
    curl -L https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz | tar -xz \
    && chmod +x kustomize \
    && mv kustomize /usr/local/bin/kustomize

USER 999