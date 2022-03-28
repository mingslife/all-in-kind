FROM gcr.lank8s.cn/kaniko-project/executor:v1.7.0-debug

ENV KUBECTL_VERSION=v1.23.3 HELM_VERSION=v3.8.0 HELM_PUSH_VERSION=0.10.2 DOCKER_CONFIG=/kube/
VOLUME [ "/share" ]
WORKDIR /kube
COPY . .

RUN mkdir -p /usr/local/bin && ln -s /share/kube-root-ca.crt/ca.crt /kube/ca.crt \
    && ln -s /share/regcred/.dockerconfigjson /kube/config.json \
    && ln -s /kube/kubectl /usr/local/bin/kubectl \
    && ln -s /kube/linux-amd64/helm /usr/local/bin/helm \
    && ln -s /kube/build.sh /usr/local/bin/app_build \
    && ln -s /kube/deploy.sh /usr/local/bin/app_deploy

RUN wget -O kubectl https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
    && wget -O helm.tar.gz https://mirrors.huaweicloud.com/helm/${HELM_VERSION}/helm-${HELM_VERSION}-linux-amd64.tar.gz \
    && tar -zxvf helm.tar.gz \
    && chmod +x -R .

RUN mkdir -p /root/.local/share/helm/plugins/helm-push /tmp \
    && cd /root/.local/share/helm/plugins/helm-push \
    && wget -O helm-push.tar.gz https://github.com/chartmuseum/helm-push/releases/download/v${HELM_PUSH_VERSION}/helm-push_${HELM_PUSH_VERSION}_linux_amd64.tar.gz \
    && tar -zxvf helm-push.tar.gz \
    && rm helm-push.tar.gz
