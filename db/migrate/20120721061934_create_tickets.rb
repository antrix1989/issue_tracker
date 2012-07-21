class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :subject
      t.text :body
      t.integer :status_id, :null => false, :default => 0
      t.string :reference
      t.string :customer_name
      t.string :customer_email
      t.integer :assigned_to_id

      t.timestamps
    end
    
    add_index :tickets, :reference, :unique => true
  end
end
