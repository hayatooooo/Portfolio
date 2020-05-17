class Category < ApplicationRecord
  has_many :sub_categories, ->{ order(:id) }
  validates :name, presence: true
end
