class Post < ActiveRecord::Base
  validates :title, presence: true, numericality: {greater_than: 0}
end
