class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable :omniauthable :rememberable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :trackable
end
