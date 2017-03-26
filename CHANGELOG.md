# Release notes for project docker-mac-openvpn


CHANGELOG
---------

### 3.3.0

* Corrected Readme to version 3.3.0
* Removed push dhcp-option DNS 8.8.8.8 and push dhcp-option DNS 8.8.4.4
* Releasing new version 3.2.1
* Corrected Readme to version 3.2.1
* Releasing new version 3.2.0
* Corrected Readme to version 3.2.0
* Removed push dhcp-option DNS 8.8.8.8 and push dhcp-option DNS 8.8.4.4
* Releasing new version 3.1.0
* Corrected Readme to version 3.1.0
* Removed push dhcp-option DNS 8.8.8.8 and push dhcp-option DNS 8.8.4.4
* Releasing new version 3.0.0
* Readme changes
* Simplification to make it ready our of the box for runninn in docker for mac environment.
* Add test for keepalive
* Add configuration for keepalive
* only block external dns when default route is pushed
* fix block-external-dns tests
* Create Dockerfile.aarch64


### v2.1.0

* README: Fix docker-compose mention
* Only load config from temp file if not empty
* Add -E flag for adding extra client config
* Fixed configuration restore instructions
* fix permission on test script
* add iptables test to list of tests
* add test for iptables rules customization functionality
* add additional documentation clarifying calling of function, purpose, and how to override it
* move iptables/nat functionality to a function (setupIptablesAndRouting) This allows iptables rule update to be overridden by creating/supplying that function in, for example, ovpn_env.sh
* using run instead of exec
* README: Connect to the OpenVPN Server Over IPv6
* Added IPv6 support to client script
* Added IPv6 support
* Fix  OVPN_ADDITIONAL_CLIENT_CONFIG
* Update documentation for docker-compose
* change test to bring in line with others
* reneg-sec needs to be set to 0 when using otp because otherwise the connection will be ask for a otp every hour. Tests added to make sure it's there when otp is enabled
* bugfix: custom route definition didn't override default
* modify command in documentation too
* remove debugging extra
* automatically add reneg-sec 0 to client and server configs when otp is being used to avoid connection resetting every hour.  Edit docs to make clear that a more secure cipher needs to be selected to use with otp to avoid the connection being reset every 64 MB of data
* systemd: Remove read-only flag on volume
* README: Add reference to the systemd doc
* README: Remove extraneous references to problems
* docs: Add systemd documentation
* bugfix: combined-saved was not making directory
* bin: copy_server_files: Backup crl.pem
* docs: backup: Fix missing volume creation
* Dockerfile: Bump to Alpine 3.5
* Update README.md
* update clients.md ; typo fix
* add logging warning to paranoid.md
* README: Explicitly create volume container
* README: Delete dead example service
* Fix for regression
* Too many arguments while pushing route
* Fix Markdown for easier display
* Added extra config doc in faqs and fixed an unlikely unbound variable
* Added test for multiple extra options
* Fix Unbound Variables
* Add multiple extra config option
* copy_server_files: Include ccd directory
* docs: paranoid: Describe how to do 4096 RSA keys
* misc: Switch from data container to data volume
* genconfig: Clean-up usage() display
* Updated otp documentation with right repository name and debug info
* google-auth: Pull from community repository again
* CONTRIBUTING: Update test path
* test: Migrate from old test scripts
* test: Migrate conf_options test
* travis: Call docker test suite run.sh
* test: Start to migrate to docker's upstream tests
* travis: Use upstream docker tests
* travis: Clean-up docker containers
* google-authenticator: Manually build Alpine package
* docs: docker-compose bugfix
* Add info on docker-compose
* README: Update image layers badge
* tests: Fix harmless typo in options test
* README: Update Image Layers shield
* Fix for Windows 10 DNS Leak
* Derive from alpine 3.4 instead of 3.2
* Sending key to proper location!
* Add "key-direction 1" to client .ovpn
* Automatically creating CCD directory
* tests: dual-proto: Kill both background servers
* tests: dual-proto: Fail gracefully on firewall
* test: Add a simple completion message and test cnt
* tests: basic: Fail gracefully on firewall
* travis: Fail when a unit test fails
* travis: Add test header
* Add dual protocol documentation
* Add dual protocol test
* Combine user args with generated args
* Set working dir in ovpn_run instead of Dockerfile
* Update README.md
* adding tests for extra server config
* allow specifying extra config
* adding ovpn_listclients script


### v2.0.0

* Created a debug section in readme
* Fix incorrect local image being used
* Add openvpn.conf gerneration -f fragment directive option
* docs: Add contribution guidelines
* Updated SELinux docs
* Added documentation details on using TCP protocol.
* Updated Alpine Linux packages, including pamtester
* Back to Alpine Linux using packaged version of google-authenticator
* Fix typo
* Update README.md
* added docs for SELinux policy file
* Added linux policy file
* Using a different volume name for otp test, should allow tests to run
* Implemented tests for 2 factor authentication
* Fix for Dockerfile, trailing slash is needed.
* OTP documentation
* Use $USER@$OVPN_CN for OTP label.
* Fixes pam authentication when dealing with virtual users
* Do not cache user credentials
* Export user pass option in client when OTP is enabled
* Allow interactive usage
* Improved script for user OTP generation, tested with pamtester
* Fixed configuration for pam module to allow login of non existing user accounts, i.e. VPN only users.
* Save OTP variable in server env
* Server side configuration for OTP
* Install google authenticator in jessie
* Reverted to debian jessie
* ovpn_run: Fix sysctl IPv6 forwarding write
* Added badges showing a few key facts next to the CI status.
* Split tunnels, as documented in &#35;51
* fixed getopts argument typo. removed ":" before "z"
* COMP-lzo param is set in client config, if defined in server.
* added config param to enable COMP-LZO compression
* Dockerfile: EasyRSA is in community now
* Respect the -D flag
* Support pushing custom DNS servers
* alpine: Use easy-rsa in testing branch of alpine
* alpine: Use alpine as base image instead of Debian


### v1.1.0

* ovpn_copy_server_files: Use short flags with rm
* ovpn_copy_server_files: Copy files without rsync
* tests: Add test for paranoid ovpn_copy_server_files
* README: Add Travis CI build status
* travis-ci: Extend test to actually do a connection
* travis-ci: Initial build test
* Only setup networking for containers which need it.
* Dockerfile: Chmod everything in /usr/local/bin
* Dockerfile: Streamline tarball extraction
* Update to easyrsa 3.0
* ovpn_copy_server_files: Copy openvpn.conf instead of symlinking locally.
* Reverted Github flavored markdown Shell syntax highlighting.
* ovpn_copy_server_files: Ensure that no other keys then the one for the server is present.
* Allow to change security related options tls-cipher, cipher and auth.
* Updated documentation.
* Add ability to set OVPN_NATDEVICE to target specific interface when using net=host
* Add a parameter to use TAP instead of TUN device.
* docs: Update docker key resource
* docs: Second pass on IPv6
* Reverted docker service restart command to use systemctl directly.
* Quick read of ipv6 docs and small fixes.
* run: Fail gracefully when IPv6 fails
* systemd: Set upstream image to latest
* Remove dh param from client config
* ovpn_run: Assume /etc/openvpn is read-only
* init: systemd: Use systemd style config overrides
* init: Update init file to be a template
* docs: backup: Correct mindless typos
* docs: faq: How do I edit `openvpn.conf`?
* docs: ipv6: Add section enabling Docker IPv6
* docs: docker: Install apt dependencies
* docs: docker: Crash course on installation
* docs: ipv6: Add initial development guide
* init: Add docker-openvpn systemd service file
* run: Add IPv6 forwarding if default route
* getclient: Use openssl to prune comments
* init: Move upstart file to init directory
* Dockerfile: Clarify port mapping
* README: Add example service
* Create ccd directory to prevent error if /etc is mounted read-only.
* Optimized ovpn_copy_server_files script. No need to copy the config files.
* Added variable OVPN_ADDITIONAL_CLIENT_CONFIG use arbitrary openvpn configuration options.
* Using better example in docs.
* license: Migrate from AGPLv3 -> MIT
* Changed license of scripts I wrote to MIT. Related to &#35;43.
* crl: Pass crl-verify if found
* docs: Fix typo to CRL steps
* ovpn: Add support for revoking certificates (CRL)
* docs: Tweak case and arguments
* genconfig: Remove duplicate-cn mention
* run: Pass cmd line arguments to openvpn


### v1.0

* license: Add AGPLv3 license
* Fixed based on the review by @kylemanna. Thanks.
* Fixed up Markdown.
* Fixed typos.
* Fixed spelling.
* EASYRSA_PKI might not be defined.
* Allow to export separated client config and wrote ovpn_getclient_all.
* Removed the --dry-run from rsync. Make it actually do something.
* Added documentation for ovpn_copy_server_files.
* genconfig: Turn off exit on error at end
* Wrote script to copy only the needed files to the docker host which runs the docker openvpn server.
* genconfig: Describe backup conf deletion
* properly clone arrays
* do not accumulate routes and push directives from default if new directives were defined
* Disable bash debug (xtrace) by default, re-enable with -e DEBUG=1
* Return correct exit status
* README: Add missing newline
* docs: Add FAQs document
* README: Add links to upstream
* README: Add Benefits section
* README: Add link to DO Tutorial
* Support client mtu push
* Create NAT if OVPN_NAT is set (flag -N)
* Control external NAT creation
* Control default DNS push with -D flag
* Remove hard coded DNS push.
* README: Update DO link to $5/mo page
* README: Remove port on genconfig line
* Run daemon as nobody
* README: Miscellaneous Fixes
* init: Add upstart init file
* Fixed SIGTERM handling
* no connection block in client config


### v0.2

* Dockerfile: Shallow clone EasyRSA v3
* Dockerfile: Clean-up after apt operations
* docs: advanced: Fix typo
* README: Remove mention of only UDP support
* README: Add Digital Ocean reference
* avoid dup iptables rules
* README: Fix Markdown indent
* Use --cap-add=NET_ADMIN instead of --privileged
* fixing regexp to allow dashes in OVPN_SERVER_URL
* getclient: Do not autogenerate key
* README: Add --rm to init steps
* advanced: Add advanced configs
* debug: Add mention of shells
* docs: openvpn-data -> $OVPN_DATA
* genconfig: Convert OVPN_ROUTES to array
* genconfig: Add push support
* genconfig: Print success
* genconfig: Add client-to-client support
* README: Use variable for volume container name


### v0.1



### 3.2.1

* Corrected Readme to version 3.2.1
* Releasing new version 3.2.0
* Corrected Readme to version 3.2.0
* Removed push dhcp-option DNS 8.8.8.8 and push dhcp-option DNS 8.8.4.4
* Releasing new version 3.1.0
* Corrected Readme to version 3.1.0
* Removed push dhcp-option DNS 8.8.8.8 and push dhcp-option DNS 8.8.4.4
* Releasing new version 3.0.0
* Readme changes
* Simplification to make it ready our of the box for runninn in docker for mac environment.
* Add test for keepalive
* Add configuration for keepalive
* only block external dns when default route is pushed
* fix block-external-dns tests
* Create Dockerfile.aarch64


### v2.1.0

* README: Fix docker-compose mention
* Only load config from temp file if not empty
* Add -E flag for adding extra client config
* Fixed configuration restore instructions
* fix permission on test script
* add iptables test to list of tests
* add test for iptables rules customization functionality
* add additional documentation clarifying calling of function, purpose, and how to override it
* move iptables/nat functionality to a function (setupIptablesAndRouting) This allows iptables rule update to be overridden by creating/supplying that function in, for example, ovpn_env.sh
* using run instead of exec
* README: Connect to the OpenVPN Server Over IPv6
* Added IPv6 support to client script
* Added IPv6 support
* Fix  OVPN_ADDITIONAL_CLIENT_CONFIG
* Update documentation for docker-compose
* change test to bring in line with others
* reneg-sec needs to be set to 0 when using otp because otherwise the connection will be ask for a otp every hour. Tests added to make sure it's there when otp is enabled
* bugfix: custom route definition didn't override default
* modify command in documentation too
* remove debugging extra
* automatically add reneg-sec 0 to client and server configs when otp is being used to avoid connection resetting every hour.  Edit docs to make clear that a more secure cipher needs to be selected to use with otp to avoid the connection being reset every 64 MB of data
* systemd: Remove read-only flag on volume
* README: Add reference to the systemd doc
* README: Remove extraneous references to problems
* docs: Add systemd documentation
* bugfix: combined-saved was not making directory
* bin: copy_server_files: Backup crl.pem
* docs: backup: Fix missing volume creation
* Dockerfile: Bump to Alpine 3.5
* Update README.md
* update clients.md ; typo fix
* add logging warning to paranoid.md
* README: Explicitly create volume container
* README: Delete dead example service
* Fix for regression
* Too many arguments while pushing route
* Fix Markdown for easier display
* Added extra config doc in faqs and fixed an unlikely unbound variable
* Added test for multiple extra options
* Fix Unbound Variables
* Add multiple extra config option
* copy_server_files: Include ccd directory
* docs: paranoid: Describe how to do 4096 RSA keys
* misc: Switch from data container to data volume
* genconfig: Clean-up usage() display
* Updated otp documentation with right repository name and debug info
* google-auth: Pull from community repository again
* CONTRIBUTING: Update test path
* test: Migrate from old test scripts
* test: Migrate conf_options test
* travis: Call docker test suite run.sh
* test: Start to migrate to docker's upstream tests
* travis: Use upstream docker tests
* travis: Clean-up docker containers
* google-authenticator: Manually build Alpine package
* docs: docker-compose bugfix
* Add info on docker-compose
* README: Update image layers badge
* tests: Fix harmless typo in options test
* README: Update Image Layers shield
* Fix for Windows 10 DNS Leak
* Derive from alpine 3.4 instead of 3.2
* Sending key to proper location!
* Add "key-direction 1" to client .ovpn
* Automatically creating CCD directory
* tests: dual-proto: Kill both background servers
* tests: dual-proto: Fail gracefully on firewall
* test: Add a simple completion message and test cnt
* tests: basic: Fail gracefully on firewall
* travis: Fail when a unit test fails
* travis: Add test header
* Add dual protocol documentation
* Add dual protocol test
* Combine user args with generated args
* Set working dir in ovpn_run instead of Dockerfile
* Update README.md
* adding tests for extra server config
* allow specifying extra config
* adding ovpn_listclients script


### v2.0.0

* Created a debug section in readme
* Fix incorrect local image being used
* Add openvpn.conf gerneration -f fragment directive option
* docs: Add contribution guidelines
* Updated SELinux docs
* Added documentation details on using TCP protocol.
* Updated Alpine Linux packages, including pamtester
* Back to Alpine Linux using packaged version of google-authenticator
* Fix typo
* Update README.md
* added docs for SELinux policy file
* Added linux policy file
* Using a different volume name for otp test, should allow tests to run
* Implemented tests for 2 factor authentication
* Fix for Dockerfile, trailing slash is needed.
* OTP documentation
* Use $USER@$OVPN_CN for OTP label.
* Fixes pam authentication when dealing with virtual users
* Do not cache user credentials
* Export user pass option in client when OTP is enabled
* Allow interactive usage
* Improved script for user OTP generation, tested with pamtester
* Fixed configuration for pam module to allow login of non existing user accounts, i.e. VPN only users.
* Save OTP variable in server env
* Server side configuration for OTP
* Install google authenticator in jessie
* Reverted to debian jessie
* ovpn_run: Fix sysctl IPv6 forwarding write
* Added badges showing a few key facts next to the CI status.
* Split tunnels, as documented in &#35;51
* fixed getopts argument typo. removed ":" before "z"
* COMP-lzo param is set in client config, if defined in server.
* added config param to enable COMP-LZO compression
* Dockerfile: EasyRSA is in community now
* Respect the -D flag
* Support pushing custom DNS servers
* alpine: Use easy-rsa in testing branch of alpine
* alpine: Use alpine as base image instead of Debian


### v1.1.0

* ovpn_copy_server_files: Use short flags with rm
* ovpn_copy_server_files: Copy files without rsync
* tests: Add test for paranoid ovpn_copy_server_files
* README: Add Travis CI build status
* travis-ci: Extend test to actually do a connection
* travis-ci: Initial build test
* Only setup networking for containers which need it.
* Dockerfile: Chmod everything in /usr/local/bin
* Dockerfile: Streamline tarball extraction
* Update to easyrsa 3.0
* ovpn_copy_server_files: Copy openvpn.conf instead of symlinking locally.
* Reverted Github flavored markdown Shell syntax highlighting.
* ovpn_copy_server_files: Ensure that no other keys then the one for the server is present.
* Allow to change security related options tls-cipher, cipher and auth.
* Updated documentation.
* Add ability to set OVPN_NATDEVICE to target specific interface when using net=host
* Add a parameter to use TAP instead of TUN device.
* docs: Update docker key resource
* docs: Second pass on IPv6
* Reverted docker service restart command to use systemctl directly.
* Quick read of ipv6 docs and small fixes.
* run: Fail gracefully when IPv6 fails
* systemd: Set upstream image to latest
* Remove dh param from client config
* ovpn_run: Assume /etc/openvpn is read-only
* init: systemd: Use systemd style config overrides
* init: Update init file to be a template
* docs: backup: Correct mindless typos
* docs: faq: How do I edit `openvpn.conf`?
* docs: ipv6: Add section enabling Docker IPv6
* docs: docker: Install apt dependencies
* docs: docker: Crash course on installation
* docs: ipv6: Add initial development guide
* init: Add docker-openvpn systemd service file
* run: Add IPv6 forwarding if default route
* getclient: Use openssl to prune comments
* init: Move upstart file to init directory
* Dockerfile: Clarify port mapping
* README: Add example service
* Create ccd directory to prevent error if /etc is mounted read-only.
* Optimized ovpn_copy_server_files script. No need to copy the config files.
* Added variable OVPN_ADDITIONAL_CLIENT_CONFIG use arbitrary openvpn configuration options.
* Using better example in docs.
* license: Migrate from AGPLv3 -> MIT
* Changed license of scripts I wrote to MIT. Related to &#35;43.
* crl: Pass crl-verify if found
* docs: Fix typo to CRL steps
* ovpn: Add support for revoking certificates (CRL)
* docs: Tweak case and arguments
* genconfig: Remove duplicate-cn mention
* run: Pass cmd line arguments to openvpn


### v1.0

* license: Add AGPLv3 license
* Fixed based on the review by @kylemanna. Thanks.
* Fixed up Markdown.
* Fixed typos.
* Fixed spelling.
* EASYRSA_PKI might not be defined.
* Allow to export separated client config and wrote ovpn_getclient_all.
* Removed the --dry-run from rsync. Make it actually do something.
* Added documentation for ovpn_copy_server_files.
* genconfig: Turn off exit on error at end
* Wrote script to copy only the needed files to the docker host which runs the docker openvpn server.
* genconfig: Describe backup conf deletion
* properly clone arrays
* do not accumulate routes and push directives from default if new directives were defined
* Disable bash debug (xtrace) by default, re-enable with -e DEBUG=1
* Return correct exit status
* README: Add missing newline
* docs: Add FAQs document
* README: Add links to upstream
* README: Add Benefits section
* README: Add link to DO Tutorial
* Support client mtu push
* Create NAT if OVPN_NAT is set (flag -N)
* Control external NAT creation
* Control default DNS push with -D flag
* Remove hard coded DNS push.
* README: Update DO link to $5/mo page
* README: Remove port on genconfig line
* Run daemon as nobody
* README: Miscellaneous Fixes
* init: Add upstart init file
* Fixed SIGTERM handling
* no connection block in client config


### v0.2

* Dockerfile: Shallow clone EasyRSA v3
* Dockerfile: Clean-up after apt operations
* docs: advanced: Fix typo
* README: Remove mention of only UDP support
* README: Add Digital Ocean reference
* avoid dup iptables rules
* README: Fix Markdown indent
* Use --cap-add=NET_ADMIN instead of --privileged
* fixing regexp to allow dashes in OVPN_SERVER_URL
* getclient: Do not autogenerate key
* README: Add --rm to init steps
* advanced: Add advanced configs
* debug: Add mention of shells
* docs: openvpn-data -> $OVPN_DATA
* genconfig: Convert OVPN_ROUTES to array
* genconfig: Add push support
* genconfig: Print success
* genconfig: Add client-to-client support
* README: Use variable for volume container name


### v0.1



### 3.2.0

* Corrected Readme to version 3.2.0
* Removed push dhcp-option DNS 8.8.8.8 and push dhcp-option DNS 8.8.4.4
* Releasing new version 3.1.0
* Corrected Readme to version 3.1.0
* Removed push dhcp-option DNS 8.8.8.8 and push dhcp-option DNS 8.8.4.4
* Releasing new version 3.0.0
* Readme changes
* Simplification to make it ready our of the box for runninn in docker for mac environment.
* Add test for keepalive
* Add configuration for keepalive
* only block external dns when default route is pushed
* fix block-external-dns tests
* Create Dockerfile.aarch64


### v2.1.0

* README: Fix docker-compose mention
* Only load config from temp file if not empty
* Add -E flag for adding extra client config
* Fixed configuration restore instructions
* fix permission on test script
* add iptables test to list of tests
* add test for iptables rules customization functionality
* add additional documentation clarifying calling of function, purpose, and how to override it
* move iptables/nat functionality to a function (setupIptablesAndRouting) This allows iptables rule update to be overridden by creating/supplying that function in, for example, ovpn_env.sh
* using run instead of exec
* README: Connect to the OpenVPN Server Over IPv6
* Added IPv6 support to client script
* Added IPv6 support
* Fix  OVPN_ADDITIONAL_CLIENT_CONFIG
* Update documentation for docker-compose
* change test to bring in line with others
* reneg-sec needs to be set to 0 when using otp because otherwise the connection will be ask for a otp every hour. Tests added to make sure it's there when otp is enabled
* bugfix: custom route definition didn't override default
* modify command in documentation too
* remove debugging extra
* automatically add reneg-sec 0 to client and server configs when otp is being used to avoid connection resetting every hour.  Edit docs to make clear that a more secure cipher needs to be selected to use with otp to avoid the connection being reset every 64 MB of data
* systemd: Remove read-only flag on volume
* README: Add reference to the systemd doc
* README: Remove extraneous references to problems
* docs: Add systemd documentation
* bugfix: combined-saved was not making directory
* bin: copy_server_files: Backup crl.pem
* docs: backup: Fix missing volume creation
* Dockerfile: Bump to Alpine 3.5
* Update README.md
* update clients.md ; typo fix
* add logging warning to paranoid.md
* README: Explicitly create volume container
* README: Delete dead example service
* Fix for regression
* Too many arguments while pushing route
* Fix Markdown for easier display
* Added extra config doc in faqs and fixed an unlikely unbound variable
* Added test for multiple extra options
* Fix Unbound Variables
* Add multiple extra config option
* copy_server_files: Include ccd directory
* docs: paranoid: Describe how to do 4096 RSA keys
* misc: Switch from data container to data volume
* genconfig: Clean-up usage() display
* Updated otp documentation with right repository name and debug info
* google-auth: Pull from community repository again
* CONTRIBUTING: Update test path
* test: Migrate from old test scripts
* test: Migrate conf_options test
* travis: Call docker test suite run.sh
* test: Start to migrate to docker's upstream tests
* travis: Use upstream docker tests
* travis: Clean-up docker containers
* google-authenticator: Manually build Alpine package
* docs: docker-compose bugfix
* Add info on docker-compose
* README: Update image layers badge
* tests: Fix harmless typo in options test
* README: Update Image Layers shield
* Fix for Windows 10 DNS Leak
* Derive from alpine 3.4 instead of 3.2
* Sending key to proper location!
* Add "key-direction 1" to client .ovpn
* Automatically creating CCD directory
* tests: dual-proto: Kill both background servers
* tests: dual-proto: Fail gracefully on firewall
* test: Add a simple completion message and test cnt
* tests: basic: Fail gracefully on firewall
* travis: Fail when a unit test fails
* travis: Add test header
* Add dual protocol documentation
* Add dual protocol test
* Combine user args with generated args
* Set working dir in ovpn_run instead of Dockerfile
* Update README.md
* adding tests for extra server config
* allow specifying extra config
* adding ovpn_listclients script


### v2.0.0

* Created a debug section in readme
* Fix incorrect local image being used
* Add openvpn.conf gerneration -f fragment directive option
* docs: Add contribution guidelines
* Updated SELinux docs
* Added documentation details on using TCP protocol.
* Updated Alpine Linux packages, including pamtester
* Back to Alpine Linux using packaged version of google-authenticator
* Fix typo
* Update README.md
* added docs for SELinux policy file
* Added linux policy file
* Using a different volume name for otp test, should allow tests to run
* Implemented tests for 2 factor authentication
* Fix for Dockerfile, trailing slash is needed.
* OTP documentation
* Use $USER@$OVPN_CN for OTP label.
* Fixes pam authentication when dealing with virtual users
* Do not cache user credentials
* Export user pass option in client when OTP is enabled
* Allow interactive usage
* Improved script for user OTP generation, tested with pamtester
* Fixed configuration for pam module to allow login of non existing user accounts, i.e. VPN only users.
* Save OTP variable in server env
* Server side configuration for OTP
* Install google authenticator in jessie
* Reverted to debian jessie
* ovpn_run: Fix sysctl IPv6 forwarding write
* Added badges showing a few key facts next to the CI status.
* Split tunnels, as documented in &#35;51
* fixed getopts argument typo. removed ":" before "z"
* COMP-lzo param is set in client config, if defined in server.
* added config param to enable COMP-LZO compression
* Dockerfile: EasyRSA is in community now
* Respect the -D flag
* Support pushing custom DNS servers
* alpine: Use easy-rsa in testing branch of alpine
* alpine: Use alpine as base image instead of Debian


### v1.1.0

* ovpn_copy_server_files: Use short flags with rm
* ovpn_copy_server_files: Copy files without rsync
* tests: Add test for paranoid ovpn_copy_server_files
* README: Add Travis CI build status
* travis-ci: Extend test to actually do a connection
* travis-ci: Initial build test
* Only setup networking for containers which need it.
* Dockerfile: Chmod everything in /usr/local/bin
* Dockerfile: Streamline tarball extraction
* Update to easyrsa 3.0
* ovpn_copy_server_files: Copy openvpn.conf instead of symlinking locally.
* Reverted Github flavored markdown Shell syntax highlighting.
* ovpn_copy_server_files: Ensure that no other keys then the one for the server is present.
* Allow to change security related options tls-cipher, cipher and auth.
* Updated documentation.
* Add ability to set OVPN_NATDEVICE to target specific interface when using net=host
* Add a parameter to use TAP instead of TUN device.
* docs: Update docker key resource
* docs: Second pass on IPv6
* Reverted docker service restart command to use systemctl directly.
* Quick read of ipv6 docs and small fixes.
* run: Fail gracefully when IPv6 fails
* systemd: Set upstream image to latest
* Remove dh param from client config
* ovpn_run: Assume /etc/openvpn is read-only
* init: systemd: Use systemd style config overrides
* init: Update init file to be a template
* docs: backup: Correct mindless typos
* docs: faq: How do I edit `openvpn.conf`?
* docs: ipv6: Add section enabling Docker IPv6
* docs: docker: Install apt dependencies
* docs: docker: Crash course on installation
* docs: ipv6: Add initial development guide
* init: Add docker-openvpn systemd service file
* run: Add IPv6 forwarding if default route
* getclient: Use openssl to prune comments
* init: Move upstart file to init directory
* Dockerfile: Clarify port mapping
* README: Add example service
* Create ccd directory to prevent error if /etc is mounted read-only.
* Optimized ovpn_copy_server_files script. No need to copy the config files.
* Added variable OVPN_ADDITIONAL_CLIENT_CONFIG use arbitrary openvpn configuration options.
* Using better example in docs.
* license: Migrate from AGPLv3 -> MIT
* Changed license of scripts I wrote to MIT. Related to &#35;43.
* crl: Pass crl-verify if found
* docs: Fix typo to CRL steps
* ovpn: Add support for revoking certificates (CRL)
* docs: Tweak case and arguments
* genconfig: Remove duplicate-cn mention
* run: Pass cmd line arguments to openvpn


### v1.0

* license: Add AGPLv3 license
* Fixed based on the review by @kylemanna. Thanks.
* Fixed up Markdown.
* Fixed typos.
* Fixed spelling.
* EASYRSA_PKI might not be defined.
* Allow to export separated client config and wrote ovpn_getclient_all.
* Removed the --dry-run from rsync. Make it actually do something.
* Added documentation for ovpn_copy_server_files.
* genconfig: Turn off exit on error at end
* Wrote script to copy only the needed files to the docker host which runs the docker openvpn server.
* genconfig: Describe backup conf deletion
* properly clone arrays
* do not accumulate routes and push directives from default if new directives were defined
* Disable bash debug (xtrace) by default, re-enable with -e DEBUG=1
* Return correct exit status
* README: Add missing newline
* docs: Add FAQs document
* README: Add links to upstream
* README: Add Benefits section
* README: Add link to DO Tutorial
* Support client mtu push
* Create NAT if OVPN_NAT is set (flag -N)
* Control external NAT creation
* Control default DNS push with -D flag
* Remove hard coded DNS push.
* README: Update DO link to $5/mo page
* README: Remove port on genconfig line
* Run daemon as nobody
* README: Miscellaneous Fixes
* init: Add upstart init file
* Fixed SIGTERM handling
* no connection block in client config


### v0.2

* Dockerfile: Shallow clone EasyRSA v3
* Dockerfile: Clean-up after apt operations
* docs: advanced: Fix typo
* README: Remove mention of only UDP support
* README: Add Digital Ocean reference
* avoid dup iptables rules
* README: Fix Markdown indent
* Use --cap-add=NET_ADMIN instead of --privileged
* fixing regexp to allow dashes in OVPN_SERVER_URL
* getclient: Do not autogenerate key
* README: Add --rm to init steps
* advanced: Add advanced configs
* debug: Add mention of shells
* docs: openvpn-data -> $OVPN_DATA
* genconfig: Convert OVPN_ROUTES to array
* genconfig: Add push support
* genconfig: Print success
* genconfig: Add client-to-client support
* README: Use variable for volume container name


### v0.1



### 3.1.0

* Corrected Readme to version 3.1.0
* Removed push dhcp-option DNS 8.8.8.8 and push dhcp-option DNS 8.8.4.4
* Releasing new version 3.0.0
* Readme changes
* Simplification to make it ready our of the box for runninn in docker for mac environment.
* Add test for keepalive
* Add configuration for keepalive
* only block external dns when default route is pushed
* fix block-external-dns tests
* Create Dockerfile.aarch64


### v2.1.0

* README: Fix docker-compose mention
* Only load config from temp file if not empty
* Add -E flag for adding extra client config
* Fixed configuration restore instructions
* fix permission on test script
* add iptables test to list of tests
* add test for iptables rules customization functionality
* add additional documentation clarifying calling of function, purpose, and how to override it
* move iptables/nat functionality to a function (setupIptablesAndRouting) This allows iptables rule update to be overridden by creating/supplying that function in, for example, ovpn_env.sh
* using run instead of exec
* README: Connect to the OpenVPN Server Over IPv6
* Added IPv6 support to client script
* Added IPv6 support
* Fix  OVPN_ADDITIONAL_CLIENT_CONFIG
* Update documentation for docker-compose
* change test to bring in line with others
* reneg-sec needs to be set to 0 when using otp because otherwise the connection will be ask for a otp every hour. Tests added to make sure it's there when otp is enabled
* bugfix: custom route definition didn't override default
* modify command in documentation too
* remove debugging extra
* automatically add reneg-sec 0 to client and server configs when otp is being used to avoid connection resetting every hour.  Edit docs to make clear that a more secure cipher needs to be selected to use with otp to avoid the connection being reset every 64 MB of data
* systemd: Remove read-only flag on volume
* README: Add reference to the systemd doc
* README: Remove extraneous references to problems
* docs: Add systemd documentation
* bugfix: combined-saved was not making directory
* bin: copy_server_files: Backup crl.pem
* docs: backup: Fix missing volume creation
* Dockerfile: Bump to Alpine 3.5
* Update README.md
* update clients.md ; typo fix
* add logging warning to paranoid.md
* README: Explicitly create volume container
* README: Delete dead example service
* Fix for regression
* Too many arguments while pushing route
* Fix Markdown for easier display
* Added extra config doc in faqs and fixed an unlikely unbound variable
* Added test for multiple extra options
* Fix Unbound Variables
* Add multiple extra config option
* copy_server_files: Include ccd directory
* docs: paranoid: Describe how to do 4096 RSA keys
* misc: Switch from data container to data volume
* genconfig: Clean-up usage() display
* Updated otp documentation with right repository name and debug info
* google-auth: Pull from community repository again
* CONTRIBUTING: Update test path
* test: Migrate from old test scripts
* test: Migrate conf_options test
* travis: Call docker test suite run.sh
* test: Start to migrate to docker's upstream tests
* travis: Use upstream docker tests
* travis: Clean-up docker containers
* google-authenticator: Manually build Alpine package
* docs: docker-compose bugfix
* Add info on docker-compose
* README: Update image layers badge
* tests: Fix harmless typo in options test
* README: Update Image Layers shield
* Fix for Windows 10 DNS Leak
* Derive from alpine 3.4 instead of 3.2
* Sending key to proper location!
* Add "key-direction 1" to client .ovpn
* Automatically creating CCD directory
* tests: dual-proto: Kill both background servers
* tests: dual-proto: Fail gracefully on firewall
* test: Add a simple completion message and test cnt
* tests: basic: Fail gracefully on firewall
* travis: Fail when a unit test fails
* travis: Add test header
* Add dual protocol documentation
* Add dual protocol test
* Combine user args with generated args
* Set working dir in ovpn_run instead of Dockerfile
* Update README.md
* adding tests for extra server config
* allow specifying extra config
* adding ovpn_listclients script


### v2.0.0

* Created a debug section in readme
* Fix incorrect local image being used
* Add openvpn.conf gerneration -f fragment directive option
* docs: Add contribution guidelines
* Updated SELinux docs
* Added documentation details on using TCP protocol.
* Updated Alpine Linux packages, including pamtester
* Back to Alpine Linux using packaged version of google-authenticator
* Fix typo
* Update README.md
* added docs for SELinux policy file
* Added linux policy file
* Using a different volume name for otp test, should allow tests to run
* Implemented tests for 2 factor authentication
* Fix for Dockerfile, trailing slash is needed.
* OTP documentation
* Use $USER@$OVPN_CN for OTP label.
* Fixes pam authentication when dealing with virtual users
* Do not cache user credentials
* Export user pass option in client when OTP is enabled
* Allow interactive usage
* Improved script for user OTP generation, tested with pamtester
* Fixed configuration for pam module to allow login of non existing user accounts, i.e. VPN only users.
* Save OTP variable in server env
* Server side configuration for OTP
* Install google authenticator in jessie
* Reverted to debian jessie
* ovpn_run: Fix sysctl IPv6 forwarding write
* Added badges showing a few key facts next to the CI status.
* Split tunnels, as documented in &#35;51
* fixed getopts argument typo. removed ":" before "z"
* COMP-lzo param is set in client config, if defined in server.
* added config param to enable COMP-LZO compression
* Dockerfile: EasyRSA is in community now
* Respect the -D flag
* Support pushing custom DNS servers
* alpine: Use easy-rsa in testing branch of alpine
* alpine: Use alpine as base image instead of Debian


### v1.1.0

* ovpn_copy_server_files: Use short flags with rm
* ovpn_copy_server_files: Copy files without rsync
* tests: Add test for paranoid ovpn_copy_server_files
* README: Add Travis CI build status
* travis-ci: Extend test to actually do a connection
* travis-ci: Initial build test
* Only setup networking for containers which need it.
* Dockerfile: Chmod everything in /usr/local/bin
* Dockerfile: Streamline tarball extraction
* Update to easyrsa 3.0
* ovpn_copy_server_files: Copy openvpn.conf instead of symlinking locally.
* Reverted Github flavored markdown Shell syntax highlighting.
* ovpn_copy_server_files: Ensure that no other keys then the one for the server is present.
* Allow to change security related options tls-cipher, cipher and auth.
* Updated documentation.
* Add ability to set OVPN_NATDEVICE to target specific interface when using net=host
* Add a parameter to use TAP instead of TUN device.
* docs: Update docker key resource
* docs: Second pass on IPv6
* Reverted docker service restart command to use systemctl directly.
* Quick read of ipv6 docs and small fixes.
* run: Fail gracefully when IPv6 fails
* systemd: Set upstream image to latest
* Remove dh param from client config
* ovpn_run: Assume /etc/openvpn is read-only
* init: systemd: Use systemd style config overrides
* init: Update init file to be a template
* docs: backup: Correct mindless typos
* docs: faq: How do I edit `openvpn.conf`?
* docs: ipv6: Add section enabling Docker IPv6
* docs: docker: Install apt dependencies
* docs: docker: Crash course on installation
* docs: ipv6: Add initial development guide
* init: Add docker-openvpn systemd service file
* run: Add IPv6 forwarding if default route
* getclient: Use openssl to prune comments
* init: Move upstart file to init directory
* Dockerfile: Clarify port mapping
* README: Add example service
* Create ccd directory to prevent error if /etc is mounted read-only.
* Optimized ovpn_copy_server_files script. No need to copy the config files.
* Added variable OVPN_ADDITIONAL_CLIENT_CONFIG use arbitrary openvpn configuration options.
* Using better example in docs.
* license: Migrate from AGPLv3 -> MIT
* Changed license of scripts I wrote to MIT. Related to &#35;43.
* crl: Pass crl-verify if found
* docs: Fix typo to CRL steps
* ovpn: Add support for revoking certificates (CRL)
* docs: Tweak case and arguments
* genconfig: Remove duplicate-cn mention
* run: Pass cmd line arguments to openvpn


### v1.0

* license: Add AGPLv3 license
* Fixed based on the review by @kylemanna. Thanks.
* Fixed up Markdown.
* Fixed typos.
* Fixed spelling.
* EASYRSA_PKI might not be defined.
* Allow to export separated client config and wrote ovpn_getclient_all.
* Removed the --dry-run from rsync. Make it actually do something.
* Added documentation for ovpn_copy_server_files.
* genconfig: Turn off exit on error at end
* Wrote script to copy only the needed files to the docker host which runs the docker openvpn server.
* genconfig: Describe backup conf deletion
* properly clone arrays
* do not accumulate routes and push directives from default if new directives were defined
* Disable bash debug (xtrace) by default, re-enable with -e DEBUG=1
* Return correct exit status
* README: Add missing newline
* docs: Add FAQs document
* README: Add links to upstream
* README: Add Benefits section
* README: Add link to DO Tutorial
* Support client mtu push
* Create NAT if OVPN_NAT is set (flag -N)
* Control external NAT creation
* Control default DNS push with -D flag
* Remove hard coded DNS push.
* README: Update DO link to $5/mo page
* README: Remove port on genconfig line
* Run daemon as nobody
* README: Miscellaneous Fixes
* init: Add upstart init file
* Fixed SIGTERM handling
* no connection block in client config


### v0.2

* Dockerfile: Shallow clone EasyRSA v3
* Dockerfile: Clean-up after apt operations
* docs: advanced: Fix typo
* README: Remove mention of only UDP support
* README: Add Digital Ocean reference
* avoid dup iptables rules
* README: Fix Markdown indent
* Use --cap-add=NET_ADMIN instead of --privileged
* fixing regexp to allow dashes in OVPN_SERVER_URL
* getclient: Do not autogenerate key
* README: Add --rm to init steps
* advanced: Add advanced configs
* debug: Add mention of shells
* docs: openvpn-data -> $OVPN_DATA
* genconfig: Convert OVPN_ROUTES to array
* genconfig: Add push support
* genconfig: Print success
* genconfig: Add client-to-client support
* README: Use variable for volume container name


### v0.1



### 3.0.0

* Simplification to make it ready our of the box for runninn in docker for mac environment.
* Add test for keepalive
* Add configuration for keepalive
* only block external dns when default route is pushed
* fix block-external-dns tests
* Create Dockerfile.aarch64


### v2.1.0

* README: Fix docker-compose mention
* Only load config from temp file if not empty
* Add -E flag for adding extra client config
* Fixed configuration restore instructions
* fix permission on test script
* add iptables test to list of tests
* add test for iptables rules customization functionality
* add additional documentation clarifying calling of function, purpose, and how to override it
* move iptables/nat functionality to a function (setupIptablesAndRouting) This allows iptables rule update to be overridden by creating/supplying that function in, for example, ovpn_env.sh
* using run instead of exec
* README: Connect to the OpenVPN Server Over IPv6
* Added IPv6 support to client script
* Added IPv6 support
* Fix  OVPN_ADDITIONAL_CLIENT_CONFIG
* Update documentation for docker-compose
* change test to bring in line with others
* reneg-sec needs to be set to 0 when using otp because otherwise the connection will be ask for a otp every hour. Tests added to make sure it's there when otp is enabled
* bugfix: custom route definition didn't override default
* modify command in documentation too
* remove debugging extra
* automatically add reneg-sec 0 to client and server configs when otp is being used to avoid connection resetting every hour.  Edit docs to make clear that a more secure cipher needs to be selected to use with otp to avoid the connection being reset every 64 MB of data
* systemd: Remove read-only flag on volume
* README: Add reference to the systemd doc
* README: Remove extraneous references to problems
* docs: Add systemd documentation
* bugfix: combined-saved was not making directory
* bin: copy_server_files: Backup crl.pem
* docs: backup: Fix missing volume creation
* Dockerfile: Bump to Alpine 3.5
* Update README.md
* update clients.md ; typo fix
* add logging warning to paranoid.md
* README: Explicitly create volume container
* README: Delete dead example service
* Fix for regression
* Too many arguments while pushing route
* Fix Markdown for easier display
* Added extra config doc in faqs and fixed an unlikely unbound variable
* Added test for multiple extra options
* Fix Unbound Variables
* Add multiple extra config option
* copy_server_files: Include ccd directory
* docs: paranoid: Describe how to do 4096 RSA keys
* misc: Switch from data container to data volume
* genconfig: Clean-up usage() display
* Updated otp documentation with right repository name and debug info
* google-auth: Pull from community repository again
* CONTRIBUTING: Update test path
* test: Migrate from old test scripts
* test: Migrate conf_options test
* travis: Call docker test suite run.sh
* test: Start to migrate to docker's upstream tests
* travis: Use upstream docker tests
* travis: Clean-up docker containers
* google-authenticator: Manually build Alpine package
* docs: docker-compose bugfix
* Add info on docker-compose
* README: Update image layers badge
* tests: Fix harmless typo in options test
* README: Update Image Layers shield
* Fix for Windows 10 DNS Leak
* Derive from alpine 3.4 instead of 3.2
* Sending key to proper location!
* Add "key-direction 1" to client .ovpn
* Automatically creating CCD directory
* tests: dual-proto: Kill both background servers
* tests: dual-proto: Fail gracefully on firewall
* test: Add a simple completion message and test cnt
* tests: basic: Fail gracefully on firewall
* travis: Fail when a unit test fails
* travis: Add test header
* Add dual protocol documentation
* Add dual protocol test
* Combine user args with generated args
* Set working dir in ovpn_run instead of Dockerfile
* Update README.md
* adding tests for extra server config
* allow specifying extra config
* adding ovpn_listclients script


### v2.0.0

* Created a debug section in readme
* Fix incorrect local image being used
* Add openvpn.conf gerneration -f fragment directive option
* docs: Add contribution guidelines
* Updated SELinux docs
* Added documentation details on using TCP protocol.
* Updated Alpine Linux packages, including pamtester
* Back to Alpine Linux using packaged version of google-authenticator
* Fix typo
* Update README.md
* added docs for SELinux policy file
* Added linux policy file
* Using a different volume name for otp test, should allow tests to run
* Implemented tests for 2 factor authentication
* Fix for Dockerfile, trailing slash is needed.
* OTP documentation
* Use $USER@$OVPN_CN for OTP label.
* Fixes pam authentication when dealing with virtual users
* Do not cache user credentials
* Export user pass option in client when OTP is enabled
* Allow interactive usage
* Improved script for user OTP generation, tested with pamtester
* Fixed configuration for pam module to allow login of non existing user accounts, i.e. VPN only users.
* Save OTP variable in server env
* Server side configuration for OTP
* Install google authenticator in jessie
* Reverted to debian jessie
* ovpn_run: Fix sysctl IPv6 forwarding write
* Added badges showing a few key facts next to the CI status.
* Split tunnels, as documented in &#35;51
* fixed getopts argument typo. removed ":" before "z"
* COMP-lzo param is set in client config, if defined in server.
* added config param to enable COMP-LZO compression
* Dockerfile: EasyRSA is in community now
* Respect the -D flag
* Support pushing custom DNS servers
* alpine: Use easy-rsa in testing branch of alpine
* alpine: Use alpine as base image instead of Debian


### v1.1.0

* ovpn_copy_server_files: Use short flags with rm
* ovpn_copy_server_files: Copy files without rsync
* tests: Add test for paranoid ovpn_copy_server_files
* README: Add Travis CI build status
* travis-ci: Extend test to actually do a connection
* travis-ci: Initial build test
* Only setup networking for containers which need it.
* Dockerfile: Chmod everything in /usr/local/bin
* Dockerfile: Streamline tarball extraction
* Update to easyrsa 3.0
* ovpn_copy_server_files: Copy openvpn.conf instead of symlinking locally.
* Reverted Github flavored markdown Shell syntax highlighting.
* ovpn_copy_server_files: Ensure that no other keys then the one for the server is present.
* Allow to change security related options tls-cipher, cipher and auth.
* Updated documentation.
* Add ability to set OVPN_NATDEVICE to target specific interface when using net=host
* Add a parameter to use TAP instead of TUN device.
* docs: Update docker key resource
* docs: Second pass on IPv6
* Reverted docker service restart command to use systemctl directly.
* Quick read of ipv6 docs and small fixes.
* run: Fail gracefully when IPv6 fails
* systemd: Set upstream image to latest
* Remove dh param from client config
* ovpn_run: Assume /etc/openvpn is read-only
* init: systemd: Use systemd style config overrides
* init: Update init file to be a template
* docs: backup: Correct mindless typos
* docs: faq: How do I edit `openvpn.conf`?
* docs: ipv6: Add section enabling Docker IPv6
* docs: docker: Install apt dependencies
* docs: docker: Crash course on installation
* docs: ipv6: Add initial development guide
* init: Add docker-openvpn systemd service file
* run: Add IPv6 forwarding if default route
* getclient: Use openssl to prune comments
* init: Move upstart file to init directory
* Dockerfile: Clarify port mapping
* README: Add example service
* Create ccd directory to prevent error if /etc is mounted read-only.
* Optimized ovpn_copy_server_files script. No need to copy the config files.
* Added variable OVPN_ADDITIONAL_CLIENT_CONFIG use arbitrary openvpn configuration options.
* Using better example in docs.
* license: Migrate from AGPLv3 -> MIT
* Changed license of scripts I wrote to MIT. Related to &#35;43.
* crl: Pass crl-verify if found
* docs: Fix typo to CRL steps
* ovpn: Add support for revoking certificates (CRL)
* docs: Tweak case and arguments
* genconfig: Remove duplicate-cn mention
* run: Pass cmd line arguments to openvpn


### v1.0

* license: Add AGPLv3 license
* Fixed based on the review by @kylemanna. Thanks.
* Fixed up Markdown.
* Fixed typos.
* Fixed spelling.
* EASYRSA_PKI might not be defined.
* Allow to export separated client config and wrote ovpn_getclient_all.
* Removed the --dry-run from rsync. Make it actually do something.
* Added documentation for ovpn_copy_server_files.
* genconfig: Turn off exit on error at end
* Wrote script to copy only the needed files to the docker host which runs the docker openvpn server.
* genconfig: Describe backup conf deletion
* properly clone arrays
* do not accumulate routes and push directives from default if new directives were defined
* Disable bash debug (xtrace) by default, re-enable with -e DEBUG=1
* Return correct exit status
* README: Add missing newline
* docs: Add FAQs document
* README: Add links to upstream
* README: Add Benefits section
* README: Add link to DO Tutorial
* Support client mtu push
* Create NAT if OVPN_NAT is set (flag -N)
* Control external NAT creation
* Control default DNS push with -D flag
* Remove hard coded DNS push.
* README: Update DO link to $5/mo page
* README: Remove port on genconfig line
* Run daemon as nobody
* README: Miscellaneous Fixes
* init: Add upstart init file
* Fixed SIGTERM handling
* no connection block in client config


### v0.2

* Dockerfile: Shallow clone EasyRSA v3
* Dockerfile: Clean-up after apt operations
* docs: advanced: Fix typo
* README: Remove mention of only UDP support
* README: Add Digital Ocean reference
* avoid dup iptables rules
* README: Fix Markdown indent
* Use --cap-add=NET_ADMIN instead of --privileged
* fixing regexp to allow dashes in OVPN_SERVER_URL
* getclient: Do not autogenerate key
* README: Add --rm to init steps
* advanced: Add advanced configs
* debug: Add mention of shells
* docs: openvpn-data -> $OVPN_DATA
* genconfig: Convert OVPN_ROUTES to array
* genconfig: Add push support
* genconfig: Print success
* genconfig: Add client-to-client support
* README: Use variable for volume container name




________

Generated by sr-release. 
