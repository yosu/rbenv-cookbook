#
# Cookbook Name:: rbenv
# Provider:: default
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

use_inline_resources

def whyrun_supported?
  true
end

action :install do
  # rbenv
  install_git
  checkout_rbenv
  update_profile

  # ruby-build
  create_plugin_directory
  checkout_ruby_build
end

def update_profile
  create_profile_if_missing

  rbenv_bin = ::File.join(rbenv_root, 'bin')

  append_to_profile(%Q{export PATH="#{rbenv_bin}:$PATH"})
  append_to_profile('eval "$(rbenv init -)"')
end

def append_to_profile(line)
  profile = profile_path

  resource = execute "append '#{line}' to #{profile}" do
    action :nothing
    user new_resource.user
    group new_resource.user
    command "echo '#{line}' >> #{profile}"
    not_if "grep '#{line}' #{profile}"
  end
  resource.run_action(:run)
end

def create_profile_if_missing
  resource = file profile_path do
    action :nothing
    user new_resource.user
    group new_resource.user
  end
  resource.run_action(:create_if_missing)
end

def install_git
  resource = package 'git' do
    action :nothing
  end
  resource.run_action(:install)
end

def checkout_rbenv
  resource = git rbenv_root do
    action :nothing
    user new_resource.user
    group new_resource.user
    repository new_resource.git_repository
    reference new_resource.git_reference
  end
  resource.run_action(:checkout)
end

def create_plugin_directory
  resource = directory rbenv_plugin_dir do
    action :nothing
    owner new_resource.user
    group new_resource.user
  end
  resource.run_action(:create)
end

def checkout_ruby_build
  resource = git ::File.join(rbenv_plugin_dir, 'ruby-build') do
    action :nothing
    user new_resource.user
    group new_resource.user
    repository new_resource.ruby_build_repository
    reference new_resource.ruby_build_reference
  end
  resource.run_action(:checkout)
end

private

def home_dir
  require 'etc'
  Etc.getpwnam(@new_resource.user).dir
end

def rbenv_root
  ::File.join(home_dir, @new_resource.directory)
end

def profile_path
  ::File.join(home_dir, @new_resource.profile)
end

def rbenv_plugin_dir
  ::File.join(rbenv_root, 'plugins')
end
