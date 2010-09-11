# ParentResource
module ParentResource
  module ActMethods
    def parent_resource(*keys)
      keys.each do |key|
        create_parent_resource(key)
      end
    end
    
    private
    def create_parent_resource(key)
      method_name = "_parent_#{key}"
      model = key.to_s.classify.constantize
      key_name = "#{key}_id"
      val = "@#{key}".to_sym
      
      define_method(method_name) do
        if params[key_name]
          instance_variable_set(val, model.find(params[key_name]))
        end
      end
      before_filter method_name
    end
  end
end

class ActionController::Base
  extend ParentResource::ActMethods
end
