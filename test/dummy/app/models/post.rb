class Post < ActiveRecord::Base
  validates :title, presence: true, length: {within: 20..50}
end
