class ApplicationRecord < ActiveRecord::Base
  include ActiveRecord::Filterable

  primary_abstract_class
end
