class RemoveLoggedTimeFromStats < ActiveRecord::Migration[5.2]
  def change
    remove_column :stats, :logged_time, :datetime
  end
end
