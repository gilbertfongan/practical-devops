current_dir = File.dirname(__FILE__)
log_level :info
log_location STDOUT
node_name "chefadmin"
client_key "#{current_dir}/chefadmin.pem"
validation_client_name "linox-validator"
validation_key "#{current_dir}/linox-validator.pem"
chef_server_url "https://chefserver.local:443/organizations/linox"

cookbook_path ["#{current_dir}/../cookbooks"]
