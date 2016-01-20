require 'spec_helper'
describe 'rundeck_rd_winrm_plugin' do

  context 'with defaults for all parameters' do
    it { should contain_class('rundeck_rd_winrm_plugin') }
  end
end
