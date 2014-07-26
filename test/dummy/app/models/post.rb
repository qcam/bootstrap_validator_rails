class Post < ActiveRecord::Base
  validates :title, presence: true, length: {within: 20..50}, numericality: {greater_than_or_equal_to: 20}
end
