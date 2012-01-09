require 'sinatra'
 
before do
  ## Basic blacklisting of metacharacters
  redirect to "/exception" if request.path_info =~ /\;|\|/
end
 
get '/' do
 erb :index
end

get '/exception' do
  "sorry, that's not allowed, request contains bad data"
end

post '/ping' do
  @ip = params[:ip]
  verify_as_ip_or_hostname @ip
  @ping_output = `ping -w 4 #{@ip}`
  erb :ping
end

post '/traceroute' do
  @ip = params[:ip]
  verify_as_ip_or_hostname @ip
  @traceroute_output = `traceroute #{@ip}`
  erb :traceroute
end

post '/nmap' do
  @ip = params[:ip]
  verify_as_ip_or_hostname @ip
  @nmap_output = `nmap #{@ip}`
  erb :nmap
end

get '/debug' do
  erb :debug
end
