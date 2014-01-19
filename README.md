rbenv Cookbook
==============
[![Build Status](https://travis-ci.org/yosu/rbenv-cookbook.png?branch=master)](https://travis-ci.org/yosu/rbenv-cookbook)
[![Dependency Status](https://gemnasium.com/yosu/rbenv-cookbook.png)](https://gemnasium.com/yosu/rbenv-cookbook)

Installs rbenv to user.

Requirements
------------

- CentOS 6.4
- Ubuntu 12.04

Recipes
-------
### default
Do nothing. Empty recipe for including LWRPs.

Resources/Providers
-------------------
### rbenv
Installs rbenv and ruby-build plugin to user.

#### Actions
Action  | Description                                  | Default
--------|----------------------------------------------|---------
install | Installs rbenv and ruby-build plugin to user | Yes

#### Attributes
Attribute             | Description                      | Default
----------------------|----------------------------------|---------------------------------------------
user                  | Installs rbenv to specified user | name
directory             | Directory name of the rbenv root | .rbenv
git_repository        | Git repository of the rbenv      | git://github.com/sstephenson/rbenv.git
git_reference         | Git reference of the rbenv       | master
ruby_build_repository | Git repository of the ruby-build | git://github.com/sstephenson/ruby-build.git
ruby_build_reference  | Git reference of the ruby-build  | master
profile               | File name of the user profile    | .bash_profile

