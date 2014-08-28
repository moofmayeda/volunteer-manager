class CreateModels < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.timestamps
    end

    create_table :actions do |t|
      t.string :name
      t.string :location
      t.date :date
      t.timestamps
    end

    create_join_table :actions, :volunteers, :table_name => :signups

    create_table :organizers do |t|
      t.string :name
      t.string :password_digest
      t.timestamps
    end
  end
end
