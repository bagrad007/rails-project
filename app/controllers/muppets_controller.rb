class MuppetsController < ApplicationController
  before_action :require_login

  def new
    @muppet = Muppet.new
    @muppet.muppet_shows.build
  end

  def create
    @muppet = Muppet.new(name: params[:muppet][:name])
    @muppet.save
    if @muppet.save
      @show = Show.find_by(id: params[:muppet][:muppet_shows_attributes]["0"][:show_id])
      MuppetShow.create(show_id: @show.id, muppet_id: @muppet.id, job: params[:muppet][:muppet_shows_attributes]["0"][:job])
      redirect_to user_path(current_user)
    else
      @muppet.muppet_shows.build
      binding.pry
      @errors = @muppet.errors.full_messages
      render :new
    end
  end

  def edit
    find_muppet
  end

  def update
    find_muppet
    if @muppet.update(muppet_params)
      redirect_to user_show_path(@muppet)
    else
      @show = Show.find_by(id: params[:id])
      render :edit
    end
  end

  private

  def muppet_params
    params.require(:muppet).permit(:name, muppet_shows_attributes: [:job, :muppet_id, :show_id, :id])
  end

  def find_muppet
    @muppet = Muppet.find_by(id: params[:id])
  end
end
