# Original credit: https://github.com/jpetazzo/dockvpn

# Smallest base image
FROM onedata/docker-openvpn-kube-for-mac:1.3.0



ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*



