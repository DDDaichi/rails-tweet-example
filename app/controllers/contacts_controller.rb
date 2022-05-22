class ContactsController < ApplicationController
  def new
    @errors = []
  end
  def create
    @errors = []
    if params[:name].empty?
      @errors << '名前が未入力です'
    end
    if params[:email].blank?
      @errors << 'メールアドレスが未入力です'
    end
    if params[:contact].empty?
      @errors << 'お問い合わせ内容が未入力です'
    end
    if params[:contact].length > 500
      @errors << 'お問い合わせ内容は500字以内で入力してください'
    end
    if @errors.present?
      render 'new' and return
    end


    csv = CSV.open('tmp/contacts.csv', 'a')
    time = Time.now
    csv.puts([params[:name], params[:email], params[:contact], time.strftime('%Y/%m/%d %H:%M:%S')])
    csv.close
    redirect_to('/')
  end
end
