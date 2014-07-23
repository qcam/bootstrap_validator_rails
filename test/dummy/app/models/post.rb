class Post < ActiveRecord::Base
  validates :title, presence: true, numericality: true
end
