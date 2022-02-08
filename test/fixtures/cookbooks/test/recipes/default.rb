apt_update 'update'

if platform?('windows')
  include_recipe 'chocolatey::default'
else
  build_essential 'install compilation tools' # required to compile modules
end

include_recipe 'perl::default'

cpan_module 'Install test module' do
  module_name 'Test::MockModule'
  version '>= 0.05'
  action :install
end

cpan_module 'Uninstall test module' do
  module_name 'Test::MockModule'
  action :uninstall
end

# cpan_module 'Test::MockModule' do
#   version '>= 0.05'
#   action [:install]
# end
