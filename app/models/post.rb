class Post < ApplicationRecord
    validates :title, presence:true, length: {minimum:3}
    belongs_to :user
    has_rich_text :content

    has_many :post_categories
    has_many :categories, through: :post_categories
end