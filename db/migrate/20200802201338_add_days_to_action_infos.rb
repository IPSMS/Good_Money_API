class AddDaysToActionInfos < ActiveRecord::Migration[5.2]
  def change
    add_column :action_infos, :sunday, :boolean
    add_column :action_infos, :monday, :boolean
    add_column :action_infos, :tuesday, :boolean
    add_column :action_infos, :wednesday, :boolean
    add_column :action_infos, :thursday, :boolean
    add_column :action_infos, :friday, :boolean
    add_column :action_infos, :saturday, :boolean
  end
end
