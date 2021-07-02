class AddLoggedPriceToTransactionLogs < ActiveRecord::Migration[6.0]
  def change
    add_column :transaction_logs, :logged_price, :float
  end
end
