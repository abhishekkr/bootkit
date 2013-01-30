# chef-solo config rb

cookbooks_path = File.join(File.dirname(__FILE__), '..', "cookbooks")
cookbook_path [ cookbooks_path ]

log_level :debug
file_store_path File.join(File.dirname(__FILE__), '..')
file_cache_path File.join(File.dirname(__FILE__), '..')
