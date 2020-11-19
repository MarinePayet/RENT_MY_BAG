class BagsController < ApplicationController

  def index
    all_bags = Bag.all.order(created_at: :desc)
    if params[:brand]
      @bags = Bag.where(:brand => params[:brand])
    elsif params[:mood]
      @bags = []
      all_bags.each do |bag|
        @bags << bag if bag.mood.include?(params[:mood])
      end
    elsif params[:style]
      @bags = []
      all_bags.each do |bag|
        @bags << bag if bag.style.include?(params[:style])
      end
    else
      @bags = all_bags
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

  def edit
    @bag = Bag.find(params[:id])
  end

  def update
    @bag = Bag.find(params[:id])
    @bag.update(bag_params)
    redirect_to profile_path
  end

  def destroy
    @bag = Bag.find(params[:id])
    @bag.destroy
    redirect_to profile_path
  end

  private

  def bag_params
    params.require(:bag).permit(:title, :price, :description, :brand, :availability, :color, images: [], mood: [], style: [])
  end
end
