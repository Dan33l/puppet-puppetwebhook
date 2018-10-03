# The Puppet Webhook module will install and configure the Sinatra-based web
# application that serves up a REST API for executing Puppet-related tasks.
#
# @summary Manage the installation and configuration of the puppet_webhook gem
#
# @author Vox Pupuli <voxpupuli@groups.io>
#
# @example
#   include puppetwebhook
#
# @param pkg_provider Which provider to install puppetwebhook into
#
class puppetwebhook(
  Enum['gem', 'puppet_gem'] $pkg_provider,
) {
  contain 'puppetwebhook::install'
  contain 'puppetwebhook::config'
}
