require 'spec_helper'

describe 'ssh::config' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_class('ssh::config') }

      it do
        is_expected.to contain_file('sshd_config').with(
          'ensure' => 'file',
          'path' => '/etc/ssh/sshd_config',
          'owner' => 'root',
          'group' => 'root',
          'mode' => '0600',
        )
      end

      it do
        is_expected.to contain_file('/etc/issue').with(
          'ensure' => 'file',
          'path' => '/etc/issue',
          'source' => 'puppet:///modules/ssh/issue',
          'owner' => 'root',
          'group' => 'root',
          'mode' => '0644',
        )
      end

      it { is_expected.to contain_file('sshd_config').that_requires('Package[openssh-server]') }
      it { is_expected.to contain_file('sshd_config').that_notifies('Service[sshd]') }

    end
  end
end
