class User < ActiveRecord::Base
  attr_accessible :email, :password, :activated, :serial, :admin

  def activate()
    self.update_attribute(:activated, true)
  end

  def change_password(newpass)
    self.update_attribute(:password, newpass)
  end
end
