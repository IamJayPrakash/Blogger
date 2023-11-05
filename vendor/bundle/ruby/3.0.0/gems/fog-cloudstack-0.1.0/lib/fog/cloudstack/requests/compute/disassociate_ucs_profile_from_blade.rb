module Fog
  module Cloudstack
    class Compute

      class Real
        # disassociate a profile from a blade
        #
        # {CloudStack API Reference}[http://cloudstack.apache.org/docs/api/apidocs-4.3/root_admin/disassociateUcsProfileFromBlade.html]
        def disassociate_ucs_profile_from_blade(bladeid, options={})
          options.merge!(
            'command' => 'disassociateUcsProfileFromBlade', 
            'bladeid' => bladeid  
          )
          request(options)
        end
      end

    end
  end
end

