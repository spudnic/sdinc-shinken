#
# Cookbook Name:: sdinc-shinken
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'sdinc-shinken::default' do
  before do
    # TODO: need to read the contents of the data bag into a json resource
    json = 'something'
    allow(Chef::EncryptedDataBagItem).to receive(:load).with('shinken', 'creds').and_return(json)
  end

  context 'on default' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new do |node|
        node.set['sdinc-shinken']['install_aptitude'] = 'yes'
        node.set['shinken']['webui']['credentials_data_bag'] = 'shinken'
        node.set['shinken']['webui']['credentials_data_bag_item'] = 'creds'
        node.set['shinken']['install_type'] = 'source'
      end.converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end

    it 'should install package aptitude' do
      expect(chef_run).to install_package('aptitude')
    end
  end
end
