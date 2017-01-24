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

name "glib2"
default_version "2.40.0"

dependency "libffi"

license :project_license

version("2.40.0") { source md5: "05fb7cb17eacbc718e90366a1eae60d9" }

source url: "http://ftp.gnome.org/pub/gnome/sources/glib/2.40/glib-#{version}.tar.xz"

relative_path "glib-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "./configure --prefix=#{install_dir}/embedded --disable-fam --disable-libelf", env: env

  make "-j #{workers}", env: env
  make "-j #{workers} install", env: env
end
