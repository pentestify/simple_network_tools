require './nettools'
require './helpers'
 
root_dir = File.dirname(__FILE__)
 
set :environment,	:production
set :root,        	root_dir
set :app_file,    	File.join(root_dir, 'nettools.rb')
set :public_folder, 	root_dir + '/public'
set :logging, 		true
set :run, 		false

run Sinatra::Application
