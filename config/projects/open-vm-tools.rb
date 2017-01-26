name 'open-vm-tools'
maintainer "Chef Software Inc"
homepage   "https://www.chef.io"
license "Apache-2.0"
license_file "LICENSE"

install_dir "#{default_root}/#{name}"

build_version   "0.0.5"
build_iteration 1

# creates required build directories
dependency 'preparation'

# harmony dependencies/components
dependency "open-vm-tools"

package :rpm do
  signing_passphrase ENV["OMNIBUS_RPM_SIGNING_PASSPHRASE"]
end
