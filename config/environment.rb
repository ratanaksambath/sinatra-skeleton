require "sinatra"
require "active_record"

ActiveRecord::Base.establish_connection adapter: 'sqlite3' , database: 'memory'

require 'logger'

ActiveRecord::Base.logger = Logger.new $stdout

# ActiveRecord::Schema.define do
#   self.verbose = false

#   create_table :users do |t|
#     t.string :name
#   end
# end

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each {|file| require file}
# the result is an array
Dir[APP_ROOT.join('app','models','*.rb')].each do |model_file|
  filename = File.basename(model_file, '.rb')
  autoload ActiveSupport::Inflector.camelize(filename), model_file
end



# User.create!(name: "nemo")
