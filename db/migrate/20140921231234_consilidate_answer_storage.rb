class ConsilidateAnswerStorage < ActiveRecord::Migration
  def change
    change_table :answers do |t|
      t.remove :answer_num
    end
  end
end
