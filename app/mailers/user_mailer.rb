class UserMailer < ActionMailer::Base
  default :from => 'trading@example.com'
  def registration_confirmation(member)
    @member = member
    mail(:to => @user.email, :subject => 'Thanks for registering!')
  end  
end
