ActiveAdmin.register Category do
  permit_params :name, :abbreviation, :description

  index do
    column :name
    column :abbreviation
    column :description
    actions
  end

  form do |f|
    f.inputs "Category Information" do
      f.input :name, :input_html => {:rows => 1, :cols => 10}
      f.input :abbreviation, :input_html => {:rows => 1, :cols => 10}
      f.input :description
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
     AdminCsvImport.convert_save("category", params[:dump][:file])
     redirect_to :action => :index, :notice => "CSV imported successfully!"
   end
end