require 'spec_helper'

describe 'ssh::service' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
      it { is_expected.to contain_class('ssh::service') }

      it do
        is_expected.to contain_service('sshd').with(
          'ensure' => 'running',
          'enable' => 'true',
        )
      end
    end
  end
end
