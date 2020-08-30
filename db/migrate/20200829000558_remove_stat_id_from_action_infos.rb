class RemoveStatIdFromActionInfos < ActiveRecord::Migration[5.2]
  def change
    remove_index :action_infos, :stat_id
    remove_column :action_infos, :stat_id, :string
  end
end
