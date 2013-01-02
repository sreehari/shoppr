module Shoppr
  class Category
    
    attr_accessor :attributes, :products, :offers
    
    def initialize(cat_mash)        
      Shoppr.map_mash_attrs(self, cat_mash)
      
      if self.attributes
        if self.attributes.attribute
          @attributes = self.attributes.attribute.map {|attribute| Attribute.new(attribute) } 
          @attributes.uniq!{ |attribute| attribute.id }
        else
          @attributes = []
        end
      else
        @attributes = []
      end
    
      if self.items
        if self.items.offer.is_a?(Array)
          @offers = self.items.offer.map {|offer| Offer.new(offer) } 
        else
          @offers = self.items.offer ? [Offer.new(self.items.offer)] : []
        end
        
        if self.items.product.is_a?(Array)
          @products = self.items.product.map {|product| Product.new(product) } 
        else
          @products = self.items.product ? [Product.new(self.items.product)] : []
        end
      else
        @products = []
      end
      
    end
    
  end
end
