require './config/environment'

class ApplicationController < Sinatra::Base

  register Sinatra::ActiveRecordExtension
  set :session_secret, "shipping_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  

end
