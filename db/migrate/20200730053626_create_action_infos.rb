class CreateActionInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :action_infos do |t|
      t.string :name
      t.integer :amount
      t.belongs_to :user, foreign_key: true
      t.belongs_to :stat, foreign_key: true

      t.timestamps
    end
  end
end
