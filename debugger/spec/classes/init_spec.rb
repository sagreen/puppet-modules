require 'spec_helper'
describe 'debugger' do

  context 'with defaults for all parameters' do
    it { should contain_class('debugger') }
  end
end
