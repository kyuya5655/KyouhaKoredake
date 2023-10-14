class Task < ApplicationRecord

  belongs_to :user

  has_one_attached :note_image

  validates :task_name, presence: true
  validates :task_status, presence: true
  validates :start, presence: true
  validates :limit, presence: true
  validates :present, presence: true

end
