class Task < ApplicationRecord

  belongs_to :user

  has_one_attached :image

  enum status: { waiting: 0, started: 1, completed: 2 }

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/本.png')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    image
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "limit", "name", "note", "present", "start", "status", "updated_at", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["image_attachment", "image_blob", "user"]
  end

  validates :name, presence: true
  validates :status, presence: true
  validates :present, presence: true
  validates :start, presence: true


  validates :limit, presence: true


end
