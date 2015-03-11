require 'spec_helper'

describe 'sdinc-shinken::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  describe package('aptitude') do
    it { should be_installed }
  end
end
