ActiveAdmin.register Assessment do
  permit_params :name, questions_attributes: [:id, :assessment_id, :question_type, :question_text, :scale_min, :scale_max, :_destroy]

  form do |f|
    f.inputs "Assessment Information" do
      f.input :name, :input_html => {:rows => 1, :cols => 10}
      f.has_many :questions, :heading => 'Questions' do |qf|
        qf.input :question_type, :as => :select, :collection => Question.human_readable_question_types.keys
        qf.input :question_text, :input_html => {:rows => 2, :cols => 10}
        qf.input :scale_min
        qf.input :scale_max
        qf.input :_destroy, :as=>:boolean, :required => false, :label=>'Remove'
      end
    end
    f.actions
  end
end