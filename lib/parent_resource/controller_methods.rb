module ParentResource
  module ControllerMethods
    def parent_resources(*keys)
      keys.each do |key|
        create_parent_resource(key)
      end
    end
    alias_method :parent_resource, :parent_resources

    private

    def create_parent_resource(key)
      method_name = "_parent_#{key}".to_s
      model = key.to_s.classify.constantize
      key_name = "#{key}_id"
      val = "@#{key}".to_sym

      define_method(method_name) do
        instance_variable_set(val, model.find(params[key_name])) if params[key_name]
      end
      private method_name
      before_filter method_name
    end
  end
end
