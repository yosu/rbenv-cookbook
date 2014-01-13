require 'spec_helper.rb'

describe 'fake::default' do
  HOME_DIR = '/home/vagrant'
  PROFILE = "#{HOME_DIR}/.bash_profile"

  let(:chef_run) do
    runner = ChefSpec::Runner.new(step_into: ['rbenv'])
    runner.converge(described_recipe)
  end

  before do
    Etc.stub(:getpwnam).and_return do
      passwd = Etc::Passwd.new
      passwd.dir = HOME_DIR
      passwd
    end
  end

  context 'install' do
    PROFILE_LINES = [
      'export PATH="/home/vagrant/.rbenv/bin:$PATH"',
      'eval "$(rbenv init -)"'
    ]

    before do
      PROFILE_LINES.each do |line|
        stub_command("grep '#{line}' #{PROFILE}").and_return(false)
      end
    end

    it 'installs git' do
      expect(chef_run).to install_package('git')
    end

    it 'checkout rbenv' do
      expect(chef_run).to checkout_git('/home/vagrant/.rbenv')
    end

    it 'create plugin directory' do
      expect(chef_run).to create_directory('/home/vagrant/.rbenv/plugins')
    end

    it 'checkout ruby-build plugin' do
      expect(chef_run).to checkout_git('/home/vagrant/.rbenv/plugins/ruby-build')
    end

    it 'create the file of profile if missing' do
      expect(chef_run).to create_file_if_missing('/home/vagrant/.bash_profile')
    end

    it 'append configurations to profile' do
      PROFILE_LINES.each do |line|
        expect(chef_run).to run_execute(%Q{echo '#{line}' >> #{PROFILE}})
      end
    end
  end
end
