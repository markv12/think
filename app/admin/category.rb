ActiveAdmin.register Category do
  permit_params :name, :abbreviation, :description
  form do |f|
    f.inputs "Category Information" do
      f.input :name, :input_html => {:rows => 1, :cols => 10}
      f.input :abbreviation, :input_html => {:rows => 1, :cols => 10}
      f.input :description
    end
    f.actions
  end
end