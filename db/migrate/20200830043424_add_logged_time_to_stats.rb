class AddLoggedTimeToStats < ActiveRecord::Migration[5.2]
  def change
    add_column :stats, :logged_time, :string
  end
end
