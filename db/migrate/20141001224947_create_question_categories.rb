class CreateQuestionCategories < ActiveRecord::Migration
  def change
    create_table :question_categories do |t|
      t.text :name
      t.text :abbreviation
      t.text :description
      t.boolean :positive
      t.timestamps
    end
    change_table :questions do |t|
      t.integer :question_category_id
    end
  end
end
