class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.timestamps
      t.string    :text
    end

    add_column :entries, :user_id, :integer
  end

  def self.down
    drop_table :entries
  end
end
