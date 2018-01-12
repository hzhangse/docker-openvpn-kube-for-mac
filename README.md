# OpenVPN for Docker for Mac with Kubernetess

OpenVPN server in a Docker container complete with an EasyRSA PKI CA customized to work out of the box with Docker for Mac running with Kubernetess. If you want to install the Docker for Mac and Kubernetess take a look at this [tutorial](https://rominirani.com/tutorial-getting-started-with-kubernetes-with-docker-on-mac-7f58467203fd)). When your Kubernretess is ready, please come back and deploy OpenVPN according to the Quickstart below. 

This docker creates VPN network between Docker For Mac containers and the host mac itself. It allows you to communicate directly to services running as Docker containers running on IPs `172.17.0.0/16` but also is offering same direct routing to Kubernetess pods and services running by default on networks `10.1.0.0/16` and `10.96.0.0/16` and `10.101.0.0/16`.




## Quick Start
The deployment is straightforward just follow the steps below

* Initialize the ovpn-data container that will hold the configuration files and certificates

        docker volume create --name ovpn-data
        docker run -v ovpn-data:/etc/openvpn --rm luman75/docker-openvpn-kube-for-mac:1.0.0 ovpn_genconfig -u udp://localhost

* Create CA 

You will be asked for password to CA, please set something longer than four characters and remember it for the next commands

        docker run -v ovpn-data:/etc/openvpn --rm -it luman75/docker-openvpn-kube-for-mac:1.0.0 ovpn_initpki


* Start OpenVPN server process

        docker run --dns 8.8.8.8 --restart=always -v ovpn-data:/etc/openvpn --name docker-openvpn-kube-for-mac:1.0.0 -d -p 1194:1194/udp --cap-add=NET_ADMIN luman75/docker-openvpn-kube-for-mac:1.0.0


* Generate a client certificate without a passphrase

        docker run -v ovpn-data:/etc/openvpn --rm -it luman75/docker-openvpn-kube-for-mac:1.0.0 easyrsa build-client-full DockerForMac nopass

* Retrieve the client configuration with embedded certificates

        docker run -v ovpn-data:/etc/openvpn --rm luman75/docker-openvpn-kube-for-mac:1.0.0 ovpn_getclient DockerForMac > ~/Downloads/DockerForMac.ovpn

* Install OpenVPN Configuration
You need to have Tunnelblink installed on your system [https://tunnelblick.net/downloads.html].
Then just run command

        open ~/Downloads/DockerForMac.ovpn

After you that you will have configured Tunnelblink to communicate with your Docker for Mac environment and Kubernetess environment. 



## How Does It Work?

Initialize the volume container using the `luman75/docker-openvpn-kube-for-mac:1.0.0` image with the
included scripts to automatically generate:

- Diffie-Hellman parameters
- a private key
- a self-certificate matching the private key for the OpenVPN server
- an EasyRSA CA key and certificate
- a TLS auth key from HMAC security

The OpenVPN server is started with the default run cmd of `ovpn_run`

The configuration is located in `/etc/openvpn`, and the Dockerfile
declares that directory as a volume. It means that you can start another
container with the `-v` argument, and access the configuration.
The volume also holds the PKI keys and certs so that it could be backed up.

To generate a client certificate, `luman75/docker-openvpn-kube-for-mac:1.0.0` uses EasyRSA via the
`easyrsa` command in the container's path.  The `EASYRSA_*` environmental
variables place the PKI CA under `/etc/openvpn/pki`.

Conveniently, `luman75/docker-openvpn-kube-for-mac:1.0.0` comes with a script called `ovpn_getclient`,
which dumps an inline OpenVPN client configuration file.  This single file can
then be given to a client for access to the VPN.

To enable Two Factor Authentication for clients (a.k.a. OTP) see [this document](/docs/otp.md).

# Differences to kylemanna/docker-openvpn
* This container is optimized to deliver fully transparent network routing to all Kubernetess and docker networks created by default after installing Docker for Mac with Kubernetess option enabled.
* It has built-in dnsmsq which redirect resolving all requests for domain .local to Kubernetess DNS and externally defined DNS resolver resolves everything else. The resolver must be set as the docker run argument (`--dns 8.8.8.8` which will make  Google DNS 8.8.8.8 a default resolver). Take a look at example in section  "Start OpenVPN server process"
* Push it's own DNS resolver (`dnsmasq`) as the default one, thanks to that all `.local` domains are automatically resolvable by Kubernetess, and the rest is working too
* Push routing to `route 172.17.0.0 255.255.0.0` making routing to internal docker networks 
* Push routing to `route 10.1.0.0 255.255.0.0` and `route 10.96.0.0 255.255.0.0` and `route 10.101.0.0 255.255.0.0` delivering routing to internal Kubernetes networks for pods and services.
* There is no `redirect-gateway def1` generated in `xx.ovpn` so no default route
* The main docker CMD is now supervisor which starts OpenVPN and dnsmasq

