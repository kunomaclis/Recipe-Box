class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :comments
  has_many :favorites
  has_many :recipes, through: :favorites
  has_many :recipes

  accepts_nested_attributes_for :recipes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
