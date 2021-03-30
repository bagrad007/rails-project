class MuppetsController < ApplicationController
  def index
    @muppets = Muppet.all
  end

  def new
    @muppet = Muppet.new
    @muppet.muppet_shows.build
  end

  def create
    @muppet = Muppet.new(name: params[:muppet][:name])
    @muppet.save
    if @muppet.save
      @show = Show.find_by(id: params[:muppet][:muppet_id])
      MuppetShow.create(show_id: params[:muppet][:muppet_shows_attributes]["0"][:show_id], muppet_id: @muppet.id, job: params[:muppet][:muppet_shows_attributes]["0"][:job])
      redirect_to user_path(current_user)
    else
      @errors = @muppet.errors.full_messages
      render :new
    end
  end

  def index
    @muppets = Muppet.all
  end

  private

  def muppet_params
    params.require(:muppet).permit(:name, muppet_shows_attributes: [:job, :muppet_id, :show_id])
  end
end
