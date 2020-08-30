class CreateStats < ActiveRecord::Migration[5.2]
  def change
    create_table :stats do |t|
      t.string :action_name
      t.integer :action_amount
      t.datetime :logged_time
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
