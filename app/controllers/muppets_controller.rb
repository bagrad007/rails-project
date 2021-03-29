class MuppetsController < ApplicationController
  def index
    @muppets = Muppet.all
  end

  def new
    @muppet = Muppet.new
    @muppet.shows.build
  end

  def create
    @muppet = Muppet.new(muppet_params)
    if @muppet.save
      redirect_to muppets_path
    else
      @errors = @muppet.errors.full_messages
      render :new
    end
  end

  private

  def muppet_params
    params.require(:muppet).permit(:name, :job, shows_attributes: [:name, :date])
  end
end
