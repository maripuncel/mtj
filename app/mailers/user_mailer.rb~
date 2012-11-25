class UserMailer < ActionMailer::Base
  default :from => "activate@mitjobtalk.mit.edu"
 
  def activate_email(user)
    @user = user
    @url  = "http://HEROKUURL/activate/" + user.serial
    mail(:to => user.email, :subject => "Activating Your MITJobTalk Account")
    @a = 1
  end

end
