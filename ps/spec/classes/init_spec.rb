require 'spec_helper'
describe 'ps' do

  context 'with defaults for all parameters' do
    it { should contain_class('ps') }
  end
end
