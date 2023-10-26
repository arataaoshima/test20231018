class Article < ApplicationRecord
   
    validates :article_title, presence:true, length:{minimum:5}
    has_many :article_groups
    has_many :groups, through: :article_groups
    
end
