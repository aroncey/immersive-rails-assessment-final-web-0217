class AppearancesController < ApplicationController

  def index
    @appearances = Appearance.all
  end

  def new
    @appearance = Appearance.new
  end

  def create
    @appearance = Appearance.new(appearance_params)
    if @appearance.save
      redirect_to @appearance.episode
    else
      redirect_to new_appearance_path
    end
  end

  def show
  @appearance = Appearance.find(params[:id])
  end

  def edit
    @appearance = Appearance.find(params[:id])
  end

  def update
    @appearance = Appearance.find(params[:id])
    byebug
    if @appearance.update(udpate_params)
      redirect_to appearance_path(@appearance), flash[:notice] = "Updated successfully"
    else
      redirect_to appearance_path(@appearance), :alert => 'NAHH!'
    end
    # @appearance.update(rating: params[:rating], episode: params[:episode_id], guest: params[:guest_id])
  end

  private

  def appearance_params
    params.require(:appearance).permit(:guest_id, :episode_id, :rating)
  end

  def udpate_params
    params.require(:appearance).permit(:guest_id, :episode_id, :rating, :user)
  end
end
