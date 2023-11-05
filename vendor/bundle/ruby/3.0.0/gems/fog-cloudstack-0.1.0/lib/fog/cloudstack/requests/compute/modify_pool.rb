module Fog
  module Cloudstack
    class Compute

      class Real
        # Modify pool
        #
        # {CloudStack API Reference}[http://cloudstack.apache.org/docs/api/apidocs-4.3/root_admin/modifyPool.html]
        def modify_pool(algorithm, poolname, options={})
          options.merge!(
            'command' => 'modifyPool', 
            'algorithm' => algorithm, 
            'poolname' => poolname  
          )
          request(options)
        end
      end

    end
  end
end

