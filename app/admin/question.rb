ActiveAdmin.register Question do
  permit_params :assessment_id, :question_text, :question_type, :scale_min, :scale_max, :_destroy, category_ids: []

  form do |f|
    f.inputs "Question Information" do
      f.input :assessment, :as => :select, :collection => Assessment.non_daily_assessments
      f.input :question_type, :as => :select, :collection => Question.human_readable_question_types.keys
      f.input :categories,:as => :select, :input_html => {:multiple => true}
      f.input :question_text, :input_html => {:rows => 2, :cols => 10}
      f.input :scale_min
      f.input :scale_max
    end
    f.actions
  end

  action_item :only => :index do
     link_to 'Upload CSV', :action => 'upload_csv'
   end

   collection_action :upload_csv do
     render "admin/upload_csv"
   end

   collection_action :import_csv, :method => :post do
     AdminCsvImport.convert_save("question", params[:dump][:file])
     redirect_to :action => :index
   end
end