ActiveAdmin.register Habit do
  permit_params :name, :description, category_ids: []

  index do
    column :name
    column :description
    actions
  end

  form do |f|
    f.inputs "Habit Information" do
      f.semantic_errors *f.object.errors.keys
      f.input :name, :input_html => {:rows => 1, :cols => 10}
      f.input :description
      f.input :categories,:as => :select, :input_html => {:multiple => true}
    end
    f.actions
  end
end