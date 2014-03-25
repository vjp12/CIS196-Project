# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Homework1::Application.initialize!

#mail
ActionMailer::Base.smtp_settings = {
	:user_name => 'vjp12',
	:password => 'Sendmeaway57',
	:domain => 'http://secret-fjord-1158.herokuapp.com/',	
	:port => 587,
	:authentication => :plain,
	:enable_starttls_auto => true
}