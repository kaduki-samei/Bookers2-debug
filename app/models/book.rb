class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  #PV
  is_impressionable counter_cache: true

  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  validates :category, inclusion: { in: ["参考書", "小説", "漫画"] }

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  #検索
  def self.looks(search, word)
    if search == "perfect_match"
      @book = Book.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @book = Book.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @book = Book.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @book = Book.where("title LIKE?","%#{word}%")
    else
      @book = Book.all
    end
  end

end
