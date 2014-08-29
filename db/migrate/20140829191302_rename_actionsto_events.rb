class RenameActionstoEvents < ActiveRecord::Migration
  def change
    rename_table :actions, :events
  end
end
