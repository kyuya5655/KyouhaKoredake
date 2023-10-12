class Task < ApplicationRecord

  belongs_to :user

  has_one_attached :note_image

end
