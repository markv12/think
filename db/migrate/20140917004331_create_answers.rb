class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.belongs_to :question
      t.belongs_to :assessment_response
      t.text :answer_text
      t.decimal :answer_num, :precision => 8, :scale => 2
      t.timestamps
    end
  end
end
