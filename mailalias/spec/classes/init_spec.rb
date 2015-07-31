require 'spec_helper'
describe 'mailalias' do

  context 'with defaults for all parameters' do
    it { should contain_class('mailalias') }
  end
end
