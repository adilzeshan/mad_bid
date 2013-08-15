class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :no_of_credits
      t.integer :payment_amount

      t.timestamps
      t.belongs_to :user
    end
  end
end
