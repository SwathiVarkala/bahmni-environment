import "configurations/node-configuration"
import "configurations/stack-installers-configuration"
import "configurations/stack-runtime-configuration"
import "configurations/deployment-configuration"
import "configurations/openmrs-versions-configuration.pp"

node default {
  include bahmni-configuration
  include httpd
  include bahmni-webapps
  include bahmni-ui-apps
  class { 'implementation-config':
    implementationName => "${implementation}", require => [ Class['bahmni-webapps'], Class['openelis']],
  }
  include bahmni-openerp
  include openelis
  include reference-data
}