module Commandos
  class IAmACommand
    module ClassMethods
      def use(plugin, *args, &block)
        unless plugins.include? plugin
          plugins << plugin
          extend  plugin::ClassMethods    if plugin.const_defined? :ClassMethods
          include plugin::InstanceMethods if plugin.const_defined? :InstanceMethods
        end

        self
      end

    private
      def plugins
        @@pluglins ||= []
      end
    end

    extend ClassMethods
    use self
  end
end
