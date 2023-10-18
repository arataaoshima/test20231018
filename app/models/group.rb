class Group < ApplicationRecord

    has_many :article_groups
    has_many :articles, through: :article_groups
    
end
