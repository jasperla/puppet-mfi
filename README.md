# mfi

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with mfi](#setup)
    * [What mfi affects](#what-mfi-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with mfi](#beginning-with-mfi)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module manages the `mFi` home automation software which is a
standalone Tomcat application meant to be used a desktop
application. This module only works for the `unix` package.

## Usage

There is generally little to configure, aside from the HTTP(s) ports:

- `unifi_http_port` defaults to `6080`
- `unifi_shutdown_port` defaults to`6081`
- `unifi_https_port` defaults to`6443`
- `portal_http_port` defaults to`6880`
- `portal_https_port` defaults to`6843`

## Proxy

One may want to operate a proxy in front of mFi, such as nginx. This
is documented on [my blog](http://blog.jasper.la/puppetized-mfi-controller/).

## Reference

- mFi: http://www.ubnt.com/enterprise/#mfi:overview

## Limitations

Currently only tested on OpenBSD with an uncommitted port for
`mfi`. Please submit a pull request to add support for other platforms.

## Copyright

2014 Jasper Lievisse Adriaanse <jasper@humppa.nl>
Released under the terms of the MIT license, please see [LICENSE](./LICENSE)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
