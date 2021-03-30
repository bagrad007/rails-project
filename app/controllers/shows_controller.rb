class ShowsController < ApplicationController
  def new
    @show = Show.new
  end

  def create
    @show = Show.new(show_params)
    if @show.save
      binding.pry
      redirect_to "/users/home"
    else
      @errors = @show.errors.full_messages
      render :new
    end
  end

  def show_params
    params.require(:show).permit(:name, :date)
  end
end
