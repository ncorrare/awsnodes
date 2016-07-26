require 'spec_helper'
describe 'awsnodes' do

  context 'with default values for all parameters' do
    it { should contain_class('awsnodes') }
  end
end
