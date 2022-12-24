class Article < ApplicationRecord
  validates :headline, presence: true
  validates_uniqueness_of :headline
end
