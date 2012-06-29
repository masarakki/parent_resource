require 'active_support/concern'

module ParentResource
  extend ActiveSupport::Concern

  module ClassMethods
    def parent_resources(*keys)
      keys.each do |key|
        create_parent_resource(key)
      end
    end

    private
    def create_parent_resource(key)
      model = key.to_s.classify.constantize
      key_name = "#{key}_id".to_sym
      val = "@#{key}".to_sym

      define_method(key) do
        unless instance_variable_defined?(val)
          _params = params.symbolize_keys
          res = _params.has_key?(key_name) ? model.find(_params[key_name]) : nil
          instance_variable_set(val, res)
        end
        instance_variable_get(val)
      end
    end
  end
end

ActionController::Base.send(:include, ParentResource)
