class MinibannersController < ApplicationController
  before_filter :login_required, :only=>[:create, :update, :destroy]
  def new
    @minibanner = Minibanner.new
  end
  def create
    @minibanner = Minibanner.new(params[:minibanner])
    @minibanner.save
    redirect_to "/"
  end
  def destroy
      @minibanner = Minibanner.find(params[:id])
      @minibanner.destroy
      redirect_to "/"
  end
end
