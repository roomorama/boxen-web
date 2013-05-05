Chef::Log.info "Looking for files to symlink in #{release_path}/../../shared/config/*"
rails_env = new_resource.environment["RAILS_ENV"]

known_configs = [".env", ".env.#{rails_env}"].map{|c| "#{release_path}/../../shared/config/#{c}" }
files_to_symlink =  Dir.glob("#{release_path}/../../shared/config/*") + known_configs

files_to_symlink.each do |config|
  config = ::File.expand_path(config)
  Chef::Log.info "Checking shared config #{config}"
  if ::File.exists?("#{release_path}/#{::File.basename(config)}")
    Chef::Log.info "skipping #{config}"
  else
    Chef::Log.info "Symlinking #{config}"
    system("ln -s #{config} #{release_path}/#{::File.basename(config)}")
  end
end