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

name "libdnet"
default_version "1.11"

license :project_license

dependency "zlib"

version("1.11") { source md5: "04c394ed8e1e7fc455456e79e908916d" }

source url: "http://prdownloads.sourceforge.net/libdnet/libdnet-#{version}.tar.gz"

relative_path "libdnet-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "./configure --prefix=#{install_dir}/embedded --with-pic", env: env

  make "-j #{workers}", env: env
  make "-j #{workers} install", env: env
end
