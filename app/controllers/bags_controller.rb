class BagsController < ApplicationController

  def index
    @bags = Bag.all.order(created_at: :desc)
    if params[:brand]
      @bags = Bag.where(:brand => params[:brand])
    elsif params[:mood]
      @bags = Bag.where(:mood => params[:mood])
    elsif params[:style]
      @bags = Bag.where(:style => params[:style])
    else
      @bags = Bag.all.order(created_at: :desc)
    end
  end

  def new
    @bag = Bag.new
  end

  def create
    @bag = Bag.new(bag_params)
    @bag.user = current_user
    if @bag.save
      redirect_to bag_path(@bag)
    else
      render :new
    end
  end

  def show
    @bag = Bag.find(params[:id])
    @user = @bag.user
  end

  def destroy
    @bag = Bag.find(params[:id])
    @bag.destroy
    redirect_to profile_path
  end

  private

  def bag_params
    params.require(:bag).permit(:title, :price, :description, :brand, :availability, :color, :photo, mood: [], style: [])
  end
end
