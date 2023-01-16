class FoodsController < ApplicationController
  before_action :authenticate_user!
  def index
    @foods = Food.all.where(user_id: current_user.id).order(created_at: :desc)
  end

  def new
    @new_food = Food.new
  end

  def create
    measurement_unit = params[:food][:measurement_unit]
    prices = params[:food][:price]
    quantity = params[:food][:quantity]

    @new_food = Food.new(user: current_user, name: params[:food][:name],
                         measurement_unit:, price: prices, quantity:)

    if @new_food.save
      redirect_to foods_path, notice: 'Food created successfully!'
    else
      render :new, status: 422
    end
  end

  def destroy
    @foods = Food.where(user_id: current_user.id).order(created_at: :desc)
    @food_delete = Food.find(params[:id])
    if @food_delete.destroy
      redirect_to foods_path, notice: 'Successfully deleted food'
    else
      render :new, statu: 422
    end
  end
end
