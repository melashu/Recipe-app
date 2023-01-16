class GeneralShopingListsController < ApplicationController
  before_action :authenticate_user!
  def index
    if @shopping_list.nil?
      @shopping_list = current_user.missed_food
    else
      @shopping_list
    end
    total_price
  end

  def total_price
    @total = 0
    @total_item = 0
    @shopping_list.each do |_key, value|
      if (value[:quantity] - value[:food].quantity).positive?
        @total += value[:food].price * (value[:quantity] - value[:food].quantity)
        @total_item += 1
      end
    end
  end
end
