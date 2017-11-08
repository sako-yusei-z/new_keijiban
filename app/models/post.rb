class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags, dependent: :destroy
  accepts_nested_attributes_for :tags,
                                allow_destroy: true,
                                reject_if: proc{ |attributes| attributes['category'].blank? }

  validates :title, presence: true, length: { in: 1..30 }
  validates :body, presence: true, length: { in: 1..300 }

  def self.search(search, search_type)
    if search_type == 'title'
      @post = self.where(['title LIKE ?', "%#{search}%"])
    elsif search_type == 'tag'
      @post = self.joins(:tags).where(["category LIKE ?", "%#{search}%"]).uniq
    else
      @post = self.all
    end
  end
end
