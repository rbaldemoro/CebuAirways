class Admin < ApplicationRecord
  #to secure user/admin account such as username, password
  has_secure_password
end
