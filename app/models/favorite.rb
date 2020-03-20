class Favorite < ApplicationRecord
    belongs_to :user #favoriteは１つのuserを持つ=favoriteはuserに属する
    belongs_to :topic #favoriteモデルはtopicに属する
end
