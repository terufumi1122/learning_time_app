class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user, :data
  helper_method :current_user

  def data
    @today = Date.today
    if @current_user
      @user_records = Record.where(user_id: @current_user[:id])

      @daily_total = @user_records.where(created_at: @today.all_day).sum(:lap_time) /60
      @weekly_total = @user_records.where(created_at: @today.all_week).sum(:lap_time) /60

      @monthly_total = @user_records.where(created_at: @today.all_month).sum(:lap_time) /60
      @grand_total = @user_records.sum(:lap_time) / 60

      created_time_at_the_1st_to_last = (@user_records.last(1)[0][:created_at].to_f) *1000
      created_time_at_the_2nd_to_last = (@user_records.last(2)[0][:created_at].to_f) *1000
      created_time_at_the_3rd_to_last = (@user_records.last(3)[0][:created_at].to_f) *1000
      created_time_at_the_4th_to_last = (@user_records.last(4)[0][:created_at].to_f) *1000
      created_time_at_the_5th_to_last = (@user_records.last(5)[0][:created_at].to_f) *1000
      created_time_at_the_6th_to_last = (@user_records.last(6)[0][:created_at].to_f) *1000

      learning_time_at_the_1st_to_last = @user_records.last(1)[0][:lap_time]/60
      learning_time_at_the_2nd_to_last = @user_records.last(2)[0][:lap_time]/60
      learning_time_at_the_3rd_to_last = @user_records.last(3)[0][:lap_time]/60
      learning_time_at_the_4th_to_last = @user_records.last(4)[0][:lap_time]/60
      learning_time_at_the_5th_to_last = @user_records.last(5)[0][:lap_time]/60
      learning_time_at_the_6th_to_last = @user_records.last(6)[0][:lap_time]/60


      learning_time_of_1hour_ago = @user_records.where(created_at: @today.ago(1.hour).all_hour).sum(:lap_time) /60
      learning_time_of_2hours_ago = @user_records.where(created_at: @today.ago(2.hours).all_hour).sum(:lap_time) /60
      learning_time_of_3hours_ago = @user_records.where(created_at: @today.ago(3.hours).all_hour).sum(:lap_time) /60
      learning_time_of_4hours_ago = @user_records.where(created_at: @today.ago(4.hours).all_hour).sum(:lap_time) /60
      learning_time_of_5hours_ago = @user_records.where(created_at: @today.ago(5.hours).all_hour).sum(:lap_time) /60
      learning_time_of_6hours_ago = @user_records.where(created_at: @today.ago(6.hours).all_hour).sum(:lap_time) /60
      learning_time_of_7hours_ago = @user_records.where(created_at: @today.ago(7.hours).all_hour).sum(:lap_time) /60
      learning_time_of_8hours_ago = @user_records.where(created_at: @today.ago(8.hours).all_hour).sum(:lap_time) /60

      learning_time_of_yesterday = @user_records.where(created_at: @today.ago(1.days).all_day).sum(:lap_time) /60
      learning_time_of_2days_ago = @user_records.where(created_at: @today.ago(2.days).all_day).sum(:lap_time) /60
      learning_time_of_3days_ago = @user_records.where(created_at: @today.ago(3.days).all_day).sum(:lap_time) /60
      learning_time_of_4days_ago = @user_records.where(created_at: @today.ago(4.days).all_day).sum(:lap_time) /60
      learning_time_of_5days_ago = @user_records.where(created_at: @today.ago(5.days).all_day).sum(:lap_time) /60
      learning_time_of_6days_ago = @user_records.where(created_at: @today.ago(6.days).all_day).sum(:lap_time) /60
      learning_time_of_7days_ago = @user_records.where(created_at: @today.ago(7.days).all_day).sum(:lap_time) /60

      learning_time_of_1week_ago = @user_records.where(created_at: @today.ago(1.week).all_week).sum(:lap_time) /60
      learning_time_of_2weeks_ago = @user_records.where(created_at: @today.ago(2.weeks).all_week).sum(:lap_time) /60
      learning_time_of_3weeks_ago = @user_records.where(created_at: @today.ago(3.weeks).all_week).sum(:lap_time) /60
      learning_time_of_4weeks_ago = @user_records.where(created_at: @today.ago(4.weeks).all_week).sum(:lap_time) /60

      gon.current_user = @current_user

      gon.created_time_at_the_1st_to_last = created_time_at_the_1st_to_last
      gon.created_time_at_the_2nd_to_last = created_time_at_the_2nd_to_last
      gon.created_time_at_the_3rd_to_last = created_time_at_the_3rd_to_last
      gon.created_time_at_the_4th_to_last = created_time_at_the_4th_to_last
      gon.created_time_at_the_5th_to_last = created_time_at_the_5th_to_last
      gon.created_time_at_the_6th_to_last = created_time_at_the_6th_to_last

      gon.learning_time_at_the_1st_to_last = learning_time_at_the_1st_to_last
      gon.learning_time_at_the_2nd_to_last = learning_time_at_the_2nd_to_last
      gon.learning_time_at_the_3rd_to_last = learning_time_at_the_3rd_to_last
      gon.learning_time_at_the_4th_to_last = learning_time_at_the_4th_to_last
      gon.learning_time_at_the_5th_to_last = learning_time_at_the_5th_to_last
      gon.learning_time_at_the_6th_to_last = learning_time_at_the_6th_to_last

      gon.learning_time_of_1hour_ago  = learning_time_of_1hour_ago
      gon.learning_time_of_2hours_ago = learning_time_of_2hours_ago
      gon.learning_time_of_3hours_ago = learning_time_of_3hours_ago
      gon.learning_time_of_4hours_ago = learning_time_of_4hours_ago
      gon.learning_time_of_5hours_ago = learning_time_of_5hours_ago
      gon.learning_time_of_6hours_ago = learning_time_of_6hours_ago
      gon.learning_time_of_7hours_ago = learning_time_of_7hours_ago
      gon.learning_time_of_8hours_ago = learning_time_of_8hours_ago

      gon.learning_time_of_yesterday = learning_time_of_yesterday
      gon.learning_time_of_2days_ago = learning_time_of_2days_ago
      gon.learning_time_of_3days_ago = learning_time_of_3days_ago
      gon.learning_time_of_4days_ago = learning_time_of_4days_ago
      gon.learning_time_of_5days_ago = learning_time_of_5days_ago
      gon.learning_time_of_6days_ago = learning_time_of_6days_ago
      gon.learning_time_of_7days_ago = learning_time_of_7days_ago

      gon.learning_time_of_1week_ago =  learning_time_of_1week_ago
      gon.learning_time_of_2weeks_ago =  learning_time_of_2weeks_ago
      gon.learning_time_of_3weeks_ago =  learning_time_of_3weeks_ago
      gon.learning_time_of_4weeks_ago =  learning_time_of_4weeks_ago

    end
  end

  private

  # def set_locale
  #   I18n.locale = current_user&.locale || :ja
  # end

  def logged_in?
    !current_user.nil?
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

end
