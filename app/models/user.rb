class User < ApplicationRecord

  has_many :tasks, dependent: :destroy
  has_many :limit_over_tasks, ->{where("`limit`<'#{Date.today}' and status!=2 ")},class_name: "Task"

  enum status: { waiting: 0, started: 1, completed: 2 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, presence: true

end
