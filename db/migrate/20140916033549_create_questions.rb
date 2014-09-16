class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :assessment
      t.text :question_text
      t.timestamps
    end
  end
end
