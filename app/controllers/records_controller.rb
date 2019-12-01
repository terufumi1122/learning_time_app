class RecordsController < ApplicationController

  def new

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
end