class RenameActionId < ActiveRecord::Migration
  def change
    rename_column :signups, :action_id, :event_id
  end
end
