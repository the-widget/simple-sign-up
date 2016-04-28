class User < ActiveRecord::Base
  has_many :events
  has_many :user_tasks
  has_many :tasks, :through => :user_tasks
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [:admin, :user, :guest]
end
