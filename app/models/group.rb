class Group < ApplicationRecord
    validates :group_name, presence:true, length:{minimum:3, maximum:10}
    has_many :article_groups
    has_many :articles, through: :article_groups

end
