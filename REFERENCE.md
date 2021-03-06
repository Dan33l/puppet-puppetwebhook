# Reference
<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

**Classes**

_Public Classes_

* [`puppetwebhook`](#puppetwebhook): Manage the installation and configuration of the puppet_webhook gem

_Private Classes_

* `puppetwebhook::config`: Configures puppet_webhook API server.
* `puppetwebhook::install`: Installs the puppetwebhook gem
* `puppetwebhook::service`: Manage the webhook service

## Classes

### puppetwebhook

The Puppet Webhook module will install and configure the Sinatra-based web
application that serves up a REST API for executing Puppet-related tasks.

#### Examples

##### 

```puppet
include puppetwebhook
```

##### Specify parameters

```puppet
class { 'puppetwebhook':
  pkg_provider => 'gem',
  server_cfg   => {
    server_type => 'daemon',
    host        => '0.0.0.0',
    logfile     => '/etc/puppet_webhook/webhook.log',
  },
}
```

##### Specify Parameters using hiera

```puppet
puppetwebhook::pkg_provider: 'puppet_gem'
puppetwebhook::server_cfg:
  server_type: 'simple'
  host: '192.168.100.5'
  loglevel: 'WARN'
```

#### Parameters

The following parameters are available in the `puppetwebhook` class.

##### `pkg_provider`

Data type: `Enum['gem', 'puppet_gem']`

Which provider to install puppetwebhook into

##### `pkg_version`

Data type: `String`

Install a specific version of the puppet_webhook

##### `server_cfg`

Data type: `Puppetwebhook::Serverconfig`

Hash of Server configuration options

Options:

* **:server_type** `Enum['simple', 'daemon']`: Run the API server as a daemon or not
* **:host** `Stdlib::IP::Address`: IP address to the API server will listen on.
* **:logfile** `Stdlib::Absolutepath`: Path to log file.
* **:loglevel** `Enum['WARN', 'INFO', 'DEBUG', 'ERROR']`: Log level of the server.
* **:pidfile** `Stdlib::Absolutepath`: Path to the PID file.
* **:port** `Stdlib::Port`: Port the API server will listen on.
* **:enable_ssl** `Boolean`: Enable SSL or not.
* **:ssl_verify** `Boolean`: Verify SSL certificate or not. Optional.
* **:ssl_cert** `Stdlib::Absolutepath`: Path to the SSL cert. Optional.
* **:ssl_key** `Stdlib::Absolutepath`: Path to the SSL Private key. Optional.

##### `app_cfg`

Data type: `Puppetwebhook::Appconfig`

Hash of application configuration options

Options:

* **:protected** `Boolean`: Run API server in protected mode.
* **:user** `String[1]`: API server auth user.
* **:pass** `String[1]`: API server auth password.
* **:client_cfg** `Stdlib::Absolutepath`: MCollective client config. Optional.
* **:client_timeout** `String[1]`: MCollective client timeout. Optional.
* **:use_mco_ruby** `Boolean`: Use MCollective ruby client. Optional.
* **:use_mcollective** `Boolean`: Whether to use MCollective or not.
* **:discovery_timeout** `String[1]`: MCollective discovery timeout. Optional.
* **:chatops** `Boolean`: Integrate a ChatOps tool or not. Default: false.
* **:chatops_service** `Enum['slack', 'rocketchat']`: Which chatops to use. Optional.
* **:chatops_channel** `Pattern[/\A#**/]`: Channel to post to. Optional.
* **:chatops_user** `String[1]`: User to post as. Optional.
* **:chatops_url** `Stdlib::HTTLUrl`: URL to post chatops messages to. Optional.
* **:default_branch** `String[1]`: Default R10K branch to use. Default: production
* **:ignore_environments** `Array[String[1]]`: R10K Environment to ignore. Optional.
* **:prefix_command** `String[1]`: Command that will generate an R10K prefix. Optional.
* **:r10k_deploy_arguments** `String[1]`: Arguments to pass to R10K.
* **:allow_uppercase** `Boolean`: Allow uppercase characters. Optional.
* **:command_prefix** `String[1]`: Command to execute before R10K. For example `umask 0022;`. Optional.
* **:prefix** `String[1]`: R10K prefix. Optional.
* **:github_secret** `String[1]`: Used to verify the signature on a repo. Currently only
supported for Github repos. Optional.
* **:repository_events** `Array`: Array of webhook events to ignore. Optional.

##### `binfile`

Data type: `Stdlib::Absolutepath`

Path to the puppet_webhook binary

##### `r10k_path`

Data type: `Stdlib::Absolutepath`

Path to r10k binary folder. Defaults to `/opt/puppetlabs/puppet/bin`

##### `webhook_user`

Data type: `String`

User to run puppet_webhook as

##### `webhook_group`

Data type: `String`

Group to run puppet_webhook as

##### `envfile_path`

Data type: `Stdlib::Absolutepath`



