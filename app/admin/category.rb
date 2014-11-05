ActiveAdmin.register Category do
  permit_params :name, :abbreviation, :description
end