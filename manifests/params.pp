# == Class: uwsgi::params
# Default parameters for configuring and installing
# uwsgi
#
# === Authors:
# - Josh Smeaton <josh.smeaton@gmail.com>
#
class uwsgi::params {
    $package_name        = 'uwsgi'
    $package_ensure      = 'installed'
    $package_provider    = 'pip'
    $service_name        = 'uwsgi'
    $service_ensure      = true
    $service_enable      = true
    $manage_service_file = true
    $binary_directory    = '/usr/sbin'
    $config_file         = '/etc/uwsgi.ini'
    $tyrant              = true
    $install_pip         = true
    $install_python_dev  = true
    $log_file            = '/var/log/uwsgi/uwsgi-emperor.log'
    $log_rotate          = 'no'
    $python_pip          = 'python-pip'

    case $::osfamily {
        redhat: {
            $app_directory = '/etc/uwsgi.d'
            $pidfile       = '/var/run/uwsgi/uwsgi.pid'
            $python_dev    = 'python-devel'
            $socket        = '/var/run/uwsgi/uwsgi.socket'
        }
        ubuntu: {
            $app_directory = '/etc/uwsgi.d'
            $pidfile       = '/var/run/uwsgi/uwsgi.pid'
            $python_dev    = 'python-dev'
            $socket        = '/var/run/uwsgi/uwsgi.socket'
            $service_provider    = 'systemd'
        }
        default: {
            $app_directory = '/etc/uwsgi/apps-enabled'
            $pidfile       = '/run/uwsgi/uwsgi.pid'
            $python_dev    = 'python-dev'
            $socket        = '/run/uwsgi/uwsgi.socket'
            $service_provider    = 'upstart'
        }
    }
}
