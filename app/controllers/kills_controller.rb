class KillsController < ApplicationController
  
  def new
    Rails.logger.debug("****************** kill. #{params.inspect}")
    kill = Kill.new
    kill.kill!(params[:kill][:player_id], params[:kill][:target_id])
    render :json => kill
  end
  
end