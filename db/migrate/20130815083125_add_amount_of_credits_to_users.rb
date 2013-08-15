class AddAmountOfCreditsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :amount_of_credits, :integer, :default => 0
  end
end
