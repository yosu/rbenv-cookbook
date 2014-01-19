require 'spec_helper'

describe 'rbenv' do
  let(:path) { '/home/vagrant/.rbenv/bin' }

  describe command('rbenv -v') do
    it { should return_exit_status 0 }
    its(:stdout) { should match(/rbenv/) }
  end
end

describe 'ruby-build' do
  describe file('/home/vagrant/.rbenv/plugins/ruby-build') do
    it { should be_directory }
  end
end
