require 'spec_helper'

describe 'ssh::config' do
  on_supported_os.each do |os, os_facts|
    next unless facts[:kernel] == 'Linux'
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }
    end
  end
end
