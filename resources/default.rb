#
# Cookbook Name:: rbenv
# Resource:: default
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
actions :install
default_action :install

RBENV_REPOSITORY = 'git://github.com/sstephenson/rbenv.git'
RUBY_BUILD_REPOSITORY = 'git://github.com/sstephenson/ruby-build.git'

attribute :user, kind_of: String, name_attribute: true
attribute :directory, kind_of: String, default: '.rbenv'
attribute :git_repository, kind_of: String, default: RBENV_REPOSITORY
attribute :git_reference, kind_of: String, default: 'master'
attribute :ruby_build_repository, kind_of: String, default: RUBY_BUILD_REPOSITORY
attribute :ruby_build_reference, kind_of: String, default: 'master'
attribute :profile, kind_of: String, default: '.bash_profile'
