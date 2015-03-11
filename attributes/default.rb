default['sdinc_shinken']['file_cache_path'] = File.join(Chef::Config['file_cache_path'], 'sdinc_shinken')

default['sdinc_shinken']['install_aptitude'] = 'yes'
default['shinken']['webui']['credentials_data_bag'] = 'shinken'
default['shinken']['webui']['credentials_data_bag_item'] = 'creds'
default['shinken']['install_type'] = 'source'
