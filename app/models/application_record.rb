class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  protected
  def self.find_object(collection, query, field: :name)
    case query
    when collection
      query
    when String, Symbol
      collection.find_by! field => query.to_s
    when Numeric
      collection.find query
    end
  end
end
