class CreateHabits < ActiveRecord::Migration
  def change
    create_table :habits do |t|
      t.text :name
      t.text :description
      t.timestamps
    end
    create_table :categories_habits, :id => false do |t|
      t.references :habit
      t.references :category
    end
  end
end
