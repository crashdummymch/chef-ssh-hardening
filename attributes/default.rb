# encoding: utf-8
#
# Cookbook Name:: ssh-hardening
# Attributes:: default
#
# Copyright 2012, Dominik Richter
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Define the client package name
case node['platform']
when 'redhat', 'centos', 'fedora', 'amazon', 'oracle', 'scientific'
  default['sshclient']['package'] = 'openssh-clients'
when 'debian', 'ubuntu'
  default['sshclient']['package'] = 'openssh-client'
when 'arch', 'suse', 'opensuse', 'opensuseleap'
  default['sshclient']['package'] = 'openssh'
else
  default['sshclient']['package'] = 'openssh-client'
end

# Define the server package name
case node['platform']
when 'suse', 'opensuse', 'opensuseleap'
  default['sshserver']['package'] = 'openssh'
else
  default['sshserver']['package'] = 'openssh-server'
end

# Define the service name for sshd
case node['platform_family']
when 'rhel', 'fedora', 'suse', 'freebsd', 'gentoo'
  default['sshserver']['service_name'] = 'sshd'
else
  default['sshserver']['service_name'] = 'ssh'
end

default['config_disclaimer']              = '**Note:** This file was automatically created by Hardening Framework (dev-sec.io) configuration. If you use its automated setup, do not edit this file directly, but adjust the automation instead.'
default['network']['ipv6']['enable']      = false   # sshd + ssh
default['ssh']['client']['cbc_required']  = false   # ssh
default['ssh']['server']['cbc_required']  = false   # sshd
default['ssh']['client']['weak_hmac']     = false   # ssh
default['ssh']['server']['weak_hmac']     = false   # sshd
default['ssh']['client']['weak_kex']      = false   # ssh
default['ssh']['server']['weak_kex']      = false   # sshd
default['ssh']['ports']                   = [22]  # sshd + ssh
default['ssh']['listen_to']               = ['0.0.0.0']     # sshd
default['ssh']['host_key_files']          = ['/etc/ssh/ssh_host_rsa_key', '/etc/ssh/ssh_host_dsa_key', '/etc/ssh/ssh_host_ecdsa_key']     # sshd
default['ssh']['client_alive_interval']   = 600     # sshd, 10min
default['ssh']['client_alive_count']      = 3       # sshd, ~> 3 x interval
default['ssh']['remote_hosts']            = []     # ssh
default['ssh']['allow_root_with_key']     = false   # sshd
default['ssh']['allow_tcp_forwarding']    = false   # sshd
default['ssh']['allow_agent_forwarding']  = false   # sshd
default['ssh']['allow_x11_forwarding']    = false   # sshd
default['ssh']['use_pam']                 = false   # sshd
default['ssh']['deny_users']              = []      # sshd
default['ssh']['allow_users']             = []      # sshd
default['ssh']['deny_groups']             = []      # sshd
default['ssh']['allow_groups']            = []      # sshd
default['ssh']['print_motd']              = false   # sshd
default['ssh']['print_last_log']          = false   # sshd
# set this to nil to disable banner or provide a path like '/etc/issue.net'
default['ssh']['banner']                  = nil     # sshd
default['ssh']['os_banner']               = false   # sshd (Debian OS family)

# set this to nil to let us use the default OpenSSH in case it's not set by the user
default['ssh']['use_dns']                 = nil     # sshd
# set this to nil to let us detect the attribute based on the node platform
default['ssh']['use_privilege_separation'] = nil
default['ssh']['max_auth_tries']           = 2      # sshd
default['ssh']['max_sessions']             = 10     # sshd
default['ssh']['client']['password_authentication'] = false   # ssh
default['ssh']['server']['password_authentication'] = false   # sshd
# http://undeadly.org/cgi?action=article&sid=20160114142733
default['ssh']['client']['roaming']        = false

# Define SFTP options
default['ssh']['sftp']['enable']        = false
default['ssh']['sftp']['group']         = 'sftponly'
default['ssh']['sftp']['chroot']        = '/home/%u'
