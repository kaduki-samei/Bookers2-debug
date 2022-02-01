class FavoritesController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    #変数 = モデル名.findメソッド(paramsメソッド[:カラム名])
    #※favoritesテーブルのbook_idというカラムを引数にして、いいねされた投稿(レコード)をBookモデルから取得してくる
    favorite = current_user.favorites.new(book_id: book.id)
    #変数= current_user.テーブル名.newメソッド(book_idカラム: 上で定義した変数bookのid)
    #いいね(favorites.new)したユーザーはcurrent_userで、book_idカラムにはいいねされた投稿のidが入る
    #これでfavoritesテーブルのカラム(:user_id, :book_id)を埋めることができたので、やっと保存できるね！
    favorite.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end

end
