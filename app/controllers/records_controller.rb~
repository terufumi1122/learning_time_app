class RecordsController < ApplicationController
  require 'httpclient'

  def new
    record = Record.last
    gon.last_start_time = record.start_time.to_f * 1000
  end

  def create
    record = Record.new
    record[:start_time] = Time.zone.now
    record[:user_id] = @current_user[:id]
    if record.save
      redirect_to root_path
    else
      flash.now[:alert] = 'Can\'t save record...'
      render root_path
    end
  end

  def show
    # @last_9_hours_record = @user_records.where(created_at: (@today-7)..(@today)).sum(:lap_time) /60
    @last_7_days_record = @user_records.where(created_at: (@today-7)..(@today)).sum(:lap_time) /60
    @last_4_weeks_record = @user_records.where(created_at: (@today-28)..(@today)).sum(:lap_time) /60
  end

  def update
    record = Record.last
    record[:stop_time] = Time.zone.now
    record[:lap_time] = record[:stop_time] - record[:start_time]
    if params[:emotion]
      record[:emotion] = params[:emotion]
    end
    if params[:description]
      record[:description] = params[:description]
    end
    if record.save
      redirect_to root_path
    else
      flash.now[:alert] = 'Can\'t save record...'
      render root_path
    end
  end

  def line_notify_send
    if @current_user[:line_notify_token]
      msg = <<~EOS
      #{@today.strftime('%Y-%m-%d')}
      Daily total:#{@daily_total}min.
      Weekly total:#{@weekly_total}min.
      Monthly total:#{@monthly_total}min.
      Grand total:#{@grand_total}min.
      EOS

      url = 'https://notify-api.line.me/api/notify'
      token = (@current_user[:line_notify_token])
      # httpclientを使ってリクエストの雛形を作成する
      client = HTTPClient.new
      # URIを指定
      uri = URI.parse(url)
      # LINE Notify指定のリクエストヘッダを指定
      header = {
        "Content-type" => "multipart/form-data",
        "Authorization" => "Bearer #{token}"
      }
      # 表示するメッセージをクエリとして代入。その他画像等もここで入れることが出来る。
      query = {
        "message" => msg
      }
      # POSTリクエストを作成し、レスポンスを`res`に代入
      client.post(uri, query, header)
      flash[:notice] = 'Send success!'
      redirect_to root_path
    else
      flash[:notice] = 'You Don\'t have Line Notify Token. Please register first.'
      redirect_to root_path
    end
  end
end
