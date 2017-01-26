#
# Copyright 2015 Chef Software, Inc.
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

# This software definition installs dummy project called 'discord' which consists
# of a simple makefile and C program to aid in debugging Omnibus packaging, file
# handling issues. Discord's makefile also creates hardlinks.

name "open-vm-tools"
default_version "master"

dependency "glib2"
dependency "libdnet"

license :project_license

source git: "https://github.com/vmware/open-vm-tools.git"

relative_path "open-vm-tools"

whitelist_file "libguestInfo.so"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "autoreconf -i", env: env, cwd: "#{project_dir}/open-vm-tools"
  command "./configure --prefix=#{install_dir}/embedded --enable-deploypkg=no --without-ssl --without-x --without-icu --without-kernel-modules", env: env, cwd: "#{project_dir}/open-vm-tools"

  make "-j #{workers}", env: env, cwd: "#{project_dir}/open-vm-tools"
  make "-j #{workers} install", env: env, cwd: "#{project_dir}/open-vm-tools"
end
