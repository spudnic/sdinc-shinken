#
# Cookbook Name:: sdinc-shinken
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'
require 'json'

describe 'sdinc-shinken::default' do

  context 'on default' do
    db_encrypt = 'secrets'
    db_encrypt_item = 'monitoring'

    before do
      data_bag_item_path1 = "test/integration/data_bags/#{db_encrypt}/#{db_encrypt_item}.json"
      file1 = File.read(data_bag_item_path1)
      json1 = JSON.parse(file1)
      allow(Chef::EncryptedDataBagItem).to receive(:load).with(db_encrypt, db_encrypt_item).and_return(json1)

      data_bag_item_path2 = 'test/integration/data_bags/users/testuser.json'
      file2 = File.read(data_bag_item_path2)
      json2 = JSON.parse(file2)
      allow(Chef::DataBagItem).to receive(:load).with('users', 'testuser').and_return(json2)
      stub_search(:users, 'shinken:*').and_return(json2)

    end

    let(:chef_run) do
      ChefSpec::ServerRunner.new do |node|
        node.set['sdinc-shinken']['install_aptitude'] = 'yes'
        node.set['shinken']['webui']['credentials_data_bag'] = db_encrypt
        node.set['shinken']['webui']['credentials_data_bag_item'] = db_encrypt_item
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
