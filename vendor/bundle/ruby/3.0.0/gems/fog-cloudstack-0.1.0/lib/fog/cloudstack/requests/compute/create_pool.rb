module Fog
  module Cloudstack
    class Compute

      class Real
        # Create a pool
        #
        # {CloudStack API Reference}[http://cloudstack.apache.org/docs/api/apidocs-4.3/root_admin/createPool.html]
        def create_pool(algorithm, name, options={})
          options.merge!(
            'command' => 'createPool', 
            'algorithm' => algorithm, 
            'name' => name  
          )
          request(options)
        end
      end

    end
  end
end

