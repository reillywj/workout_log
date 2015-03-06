class CategoryForm < ActionForm::Base
  self.main_model = :category
  attributes :name, :abbreviation

  association :subcategories do
    attributes :name, :rank
  end
end