class Task < ApplicationRecord

  belongs_to :user

  has_one_attached :image

  enum status: { waiting: 0, started: 1, completed: 2 }

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/本.png')
      image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
    end
    image
  end

  validates :name, presence: true
  validates :status, presence: true
  validates :present, presence: true
  validates :start, presence: true

  # def start
  #   return if start.blank?
  #   errors.add(:start, "は今日以降のものを選択してください") if start < Date.today
  # end

  validates :limit, presence: true


end
