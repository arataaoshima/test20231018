class Article < ApplicationRecord

    has_many: article_groups
    has_many: groups, through: :article_groups
    
end
