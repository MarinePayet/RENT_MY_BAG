module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filtering_params)
      results = self.where(nil)
      filtering_params.each do |attribute, bag|
        results = results.public_send("filter_by_#{attribute}", bag) if attribute.present?
      end
      results
    end
  end

private

# A list of the param names that can be used for filtering the Product list
def filtering_params(params)
  params.slice(:brand, :price, :mood)
end

end
