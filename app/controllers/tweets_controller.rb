# csvを操作するためのライブラリを読み込む
require "csv"

class TweetsController < ApplicationController
  def new
    # 新規投稿ページで@errorsのエラー文を表示するため変数を定義
    @errors = []
  end
  
  def create
    # エラー分を格納するための配列
    @errors = []
    # ユーザー名の空チェック
    if params[:name].empty?
      @errors << 'ユーザー名が未入力です'
    end
    # つぶやき内容の空チェック
    if params[:tweet].empty?
      @errors << 'つぶやき内容が未入力です'
    end
    # つぶやき内容の文字数チェック
    if params[:tweet].length > 140
      @errors  << 'ツイートは１４０字以内に収めてください'
    end
    # エラーがあったら新規投稿ページを表示する(アクションの途中なのでand returnにより以降の処理を終了する)
    if @errors.present?
      render 'new' and return
    end

    csv = CSV.open('tmp/tweets.csv', 'a')
    time = Time.now
    # paramsにはname属性のデータを格納、strftimeで日時をフォーマット変換
    csv.puts([params[:name], params[:tweet], time.strftime('%Y/%m/%d %H:%M:%S')])
    csv.close
    # トップページへリダイレクト
    redirect_to('/')
  end
end
