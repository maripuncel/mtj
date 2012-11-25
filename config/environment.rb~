# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Mtj::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :address  => "smtp.someserver.net",
  :port  => 25,
  :user_name  => "mitjobtalk@gmail.com",
  :password  => "zxcvbzxcvb",
  :authentication  => :login
}
Rails::Initializer.run do |config|
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.raise_delivery_errors = true
end
