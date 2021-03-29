class MuppetsController < ApplicationController
  def new
    @muppet = Muppet.new
  end

  def create
  end

  def muppet_params
    params.require(:muppet).permit(:name, :job)
  end
end
