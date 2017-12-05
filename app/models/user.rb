class User < ActiveRecord::Base

  has_many :tasks

  validates :username, uniqueness: { scope: :username, message: "Has already been taken" }
  validates :email, uniqueness: { scope: :email, message: "Has already been taken" }
  validates :lastname,  presence: true, length: { minimum: 4, too_short: "Your last name can not consist of less than four letters"}
  validates :firstname, presence: true, length: { minimum: 3, too_short: "Your first name can not consist of less than three letters"}
  validates :firstname, :lastname, format: { with: /\A[a-zA-Z]+\z/,
    :message => "Only letters allowed" }


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
end
