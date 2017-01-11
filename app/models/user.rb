class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :microposts, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  def feed
    Micropost.where("user_id = ?", id)
  end
  
  validates :name,  presence: true, length: { maximum: 50 }
end
