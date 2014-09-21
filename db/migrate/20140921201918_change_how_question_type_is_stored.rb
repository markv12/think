class ChangeHowQuestionTypeIsStored < ActiveRecord::Migration
  def change
    change_table :questions do |t|
      t.remove :type
      t.integer :question_type, default: 0
      t.integer :scale_min, default: 0
      t.integer :scale_max
      t.text :options, :array => true
    end
  end
end
