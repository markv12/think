class CacheTextInfo < ActiveRecord::Migration
  def change
    change_table :entries do |t|
      t.integer :wordcount, default: 0
    end
  end
end
