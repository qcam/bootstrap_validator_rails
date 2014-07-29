class Post < ActiveRecord::Base
  validates :title, presence: true, length: {within: 20..50}, numericality: {greater_than_or_equal_to: 20}
  validates :title, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :intro, presence: true, if: :published?
  validates :accepted, acceptance: true
end
