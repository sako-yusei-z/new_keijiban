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

  def self.title_search(search)
    @posts = Post.where(['title LIKE ?', "%#{search}%"])
  end

  def self.tag_search(search)
    if search.blank?
      @posts = Post.all
    else
      @posts = Post.joins(:tags).where(["category LIKE ?", "%#{search}%"])
    end
  end
end
