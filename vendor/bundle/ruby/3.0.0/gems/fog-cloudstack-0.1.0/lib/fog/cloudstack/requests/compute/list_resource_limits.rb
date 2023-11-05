module Fog
  module Cloudstack
    class Compute

      class Real
        # Lists resource limits.
        #
        # {CloudStack API Reference}[http://cloudstack.apache.org/docs/api/apidocs-4.4/root_admin/listResourceLimits.html]
        def list_resource_limits(*args)
          options = {}
          if args[0].is_a? Hash
            options = args[0]
            options.merge!('command' => 'listResourceLimits') 
          else
            options.merge!('command' => 'listResourceLimits')
          end
          request(options)
        end
      end

    end
  end
end

