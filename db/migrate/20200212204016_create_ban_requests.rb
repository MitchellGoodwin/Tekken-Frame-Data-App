class CreateBanRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.string :notes
      t.integer :post_id
      t.timestamps
    end
  end
end
