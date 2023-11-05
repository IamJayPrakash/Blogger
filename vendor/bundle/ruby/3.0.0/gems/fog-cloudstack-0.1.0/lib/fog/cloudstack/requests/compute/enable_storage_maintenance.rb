module Fog
  module Cloudstack
    class Compute

      class Real
        # Puts storage pool into maintenance state
        #
        # {CloudStack API Reference}[http://cloudstack.apache.org/docs/api/apidocs-4.4/root_admin/enableStorageMaintenance.html]
        def enable_storage_maintenance(*args)
          options = {}
          if args[0].is_a? Hash
            options = args[0]
            options.merge!('command' => 'enableStorageMaintenance') 
          else
            options.merge!('command' => 'enableStorageMaintenance', 
            'id' => args[0])
          end
          request(options)
        end
      end

    end
  end
end

