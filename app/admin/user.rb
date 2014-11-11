ActiveAdmin.register User do
  permit_params :name, :email, :admin

  index do
    column :name
    column :email
    column :admin
    column :login_count
    column :current_login_at
    column :last_login_at
    column :last_request_at
    actions
  end

  form do |f|
    f.inputs "User Information" do
      f.input :name, :input_html => {:rows => 1, :cols => 10}
      f.input :email, :input_html => {:rows => 1, :cols => 10}
      f.input :admin
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
     AdminCsvImport.convert_save("user", params[:dump][:file])
     redirect_to :action => :index
   end
end