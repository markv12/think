class ForLongerStrings < ActiveRecord::Migration
  def up
      change_column :entries, :text, :text
  end
  def down
      # This might cause trouble if you have strings longer
      # than 255 characters.
      change_column :entries, :text, :string
  end
end
