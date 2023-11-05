module Fog
  module Cloudstack
    class Compute

      class Real
        # Create a LUN from a pool
        #
        # {CloudStack API Reference}[http://cloudstack.apache.org/docs/api/apidocs-4.3/root_admin/createLunOnFiler.html]
        def create_lun_on_filer(size, name, options={})
          options.merge!(
            'command' => 'createLunOnFiler', 
            'size' => size, 
            'name' => name  
          )
          request(options)
        end
      end

    end
  end
end

