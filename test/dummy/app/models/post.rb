class Post < ActiveRecord::Base
  validates :title, presence: true, numericality: {less_than: 15}
  validates :title, acceptance: true
end
