class StocksController < ApplicationController
  before_action :authenticate_user!
  before_action :update_stocks

  def index
    case @user_type
    when 'broker'
      @stocks_list = Stock.all
    when 'buyer'
      @broker_stocks_list = BrokerStock.all
    end
  end

  private

  def update_stocks
    stocks_list = Stock.most_active_stocks
    return if stocks_list.nil?

    stocks_list.each do |stock_data|
      stock = Stock.find_or_create_by(ticker: stock_data.symbol) do |s|
        s.price = stock_data.latest_price
        s.stock = stock_data.company_name
      end
      if stock.price != stock_data.latest_price
        stock.price = stock_data.latest_price
        stock.save
      end
    end
  end

  def stock_params
    params.require(:stock).permit(:stock, :price, :ticker)
  end
end
