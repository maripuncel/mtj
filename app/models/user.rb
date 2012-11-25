class User < ActiveRecord::Base
  attr_accessible :email, :password, :activated, :serial

end
