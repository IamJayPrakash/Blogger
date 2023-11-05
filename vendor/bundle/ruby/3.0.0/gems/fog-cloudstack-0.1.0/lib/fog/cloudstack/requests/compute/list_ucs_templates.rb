module Fog
  module Cloudstack
    class Compute

      class Real
        # List templates in ucs manager
        #
        # {CloudStack API Reference}[http://cloudstack.apache.org/docs/api/apidocs-4.3/root_admin/listUcsTemplates.html]
        def list_ucs_templates(ucsmanagerid, options={})
          options.merge!(
            'command' => 'listUcsTemplates', 
            'ucsmanagerid' => ucsmanagerid  
          )
          request(options)
        end
      end

    end
  end
end

