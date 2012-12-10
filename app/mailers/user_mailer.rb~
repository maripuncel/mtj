class UserMailer < ActionMailer::Base
  default :from => "activate@mitjobtalk.mit.edu"
 
  def activate_email(user)
    @user = user
    @url  = "http://vast-dusk-2147.herokuapp.com/activate/" + user.serial
    mail(:to => user.email, :subject => "Activating Your MITJobTalk Account")
    @a = 1
  end

end
