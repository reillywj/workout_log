class CategoryForm < ActionForm::Base
  self.main_model = :category
  attributes :name, :abbreviation

  association :subcategories do
    attributes :name

    association :exercises do
      attributes :name, :nickname
    end
  end
end