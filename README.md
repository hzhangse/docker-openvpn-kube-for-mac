# OpenVPN for Docker for Mac

OpenVPN server in a Docker container complete with an EasyRSA PKI CA.

## Quick Start


* Initialize the ovpn-data container that will hold the configuration files and certificates

        docker volume create --name ovpn-data
        docker run -v ovpn-data:/etc/openvpn --rm luman75/docker-mac-openvpn:3.3.0 ovpn_genconfig -u udp://localhost
        docker run -v ovpn-data:/etc/openvpn --rm -it luman75/docker-mac-openvpn:3.3.0 ovpn_initpki

* Start OpenVPN server process

        docker run -v ovpn-data:/etc/openvpn --name docker-mac-openvpn -d -p 1194:1194/udp --cap-add=NET_ADMIN luman75/docker-mac-openvpn:3.3.0

* Generate a client certificate without a passphrase

        docker run -v ovpn-data:/etc/openvpn --rm -it luman75/docker-mac-openvpn:3.3.0 easyrsa build-client-full DockerForMac nopass

* Retrieve the client configuration with embedded certificates

        docker run -v ovpn-data:/etc/openvpn --rm luman75/docker-mac-openvpn:3.3.0 ovpn_getclient DockerForMac > DockerForMac.ovpn


## How Does It Work?

Initialize the volume container using the `luman75/docker-mac-openvpn:3.3.0` image with the
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

To generate a client certificate, `luman75/docker-mac-openvpn:3.3.0` uses EasyRSA via the
`easyrsa` command in the container's path.  The `EASYRSA_*` environmental
variables place the PKI CA under `/etc/openvpn/pki`.

Conveniently, `luman75/docker-mac-openvpn:3.3.0` comes with a script called `ovpn_getclient`,
which dumps an inline OpenVPN client configuration file.  This single file can
then be given to a client for access to the VPN.

To enable Two Factor Authentication for clients (a.k.a. OTP) see [this document](/docs/otp.md).

## Differences from kylemanna/docker-openvpn

* No logger generate any push for DNS. We assume it should be the same as the dns in OS
* Push routing to "route 172.17.0.0 255.255.0.0" making routing to internal docker networks 
* There is no "redirect-gateway def1" generated in xx.ovpn so no default route

