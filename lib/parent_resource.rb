# ParentResource
module ParentResource
  autoload :ControllerMethods, 'parent_resource/controller_methods'
end

class ActionController::Base
  extend ParentResource::ControllerMethods
end
