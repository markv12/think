class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.text :name
      t.text :abbreviation
      t.text :description
      t.timestamps
    end
    create_table :categories_questions, :id => false do |t|
      t.references :category
      t.references :question
    end
  end
end
