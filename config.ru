#root the require to the file
require ::File.expand_path('../config/environment', __FILE__)
set :app_file, __FILE__

configure do
  set :views, APP_ROOT.join("app","views")
  set :models, APP_ROOT.join("app","models")
  set :controllers, APP_ROOT.join("app","controllers")
end

run Sinatra::Application
