class Item < ApplicationRecord
  # has_one :buyer
  belongs_to :user

  has_one_attached :image

  has_one :genre
  has_one :status
  has_one :lord
  has_one :area
  has_one :days

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :item_status_id, presence: true
  validates :lord_id, presence: true
  validates :former_area_id, presence: true
  validates :days_before_id, presence: true
  validates :price, presence: true, numericality: {only_integer: true},format:{ greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
  format: { with: /\A[0-9]+\z/ }


  
                  validates :category_id, numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 21 }
                  validates :item_status_id, numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 8 }
                  validates :lord_id, numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 8 }
                  validates :former_area_id, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 47 }
                  validates :days_before_id, numericality: { greater_than_or_equal_to: 2, less_than_or_equal_to: 4 }

end
