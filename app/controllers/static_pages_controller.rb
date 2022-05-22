# csvを操作するためのライブラリを読み込む
require "csv"
class StaticPagesController < ApplicationController
  def top
    # CSVファイルの読み込み
    csv= CSV.read('tmp/tweets.csv')
    # @tweetsにファイルの中身を格納(インスタンス変数はアクションとビュー間でデータの受け渡しが可能)
    @tweets = csv
  end
end
