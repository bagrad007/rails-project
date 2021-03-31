class ShowsController < ApplicationController
  before_action :require_login

  def new
    @show = Show.new
  end

  def create
    @show = Show.new(show_params)
    @show.user_id = current_user.id
    @show.save
    if @show.save
      redirect_to user_path(@user)
    else
      @errors = @show.errors.full_messages
      render :new
    end
  end

  def show
    find_show
  end

  def shows_by_date
    @shows = Show.organize_date
    binding.pry
  end

  private

  def show_params
    params.require(:show).permit(:name, :date)
  end

  def find_show
    @show = Show.find_by(id: params[:id])
  end
end
