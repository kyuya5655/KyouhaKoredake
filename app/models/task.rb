class Task < ApplicationRecord

  belongs_to :user

  has_one_attached :note_image

  # def get_note_image(with, height)
  #   unless

  #   end
  # end

  validates :name, presence: true
  validates :status, presence: true
  validates :start, presence: true
  validates :limit, presence: true
  validates :present, presence: true

end
