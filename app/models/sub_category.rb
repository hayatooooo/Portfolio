class SubCategory < ApplicationRecord
  belongs_to :category, optional: true
  validates :name, presence: true
  validates :category, presence: true
end