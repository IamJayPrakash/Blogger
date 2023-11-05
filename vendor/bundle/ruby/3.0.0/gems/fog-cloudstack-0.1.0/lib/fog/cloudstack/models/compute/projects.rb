require 'fog/core/collection'
require 'fog/cloudstack/models/compute/project'

module Fog
  module Cloudstack
    class Compute
      class Projects < Fog::Collection
        model Fog::Cloudstack::Compute::Project

        def all(filters={})
          options = get_filter_options(filters)

          data = service.list_projects(options)["listprojectsresponse"]["project"] || []
          load(data)
        end

        def get(project_id, filters={})
          filter_option = get_filter_options(filters)
          options = filter_option.merge('id' => project_id)

          if template = service.list_projects(options)["listprojectsresponse"]["project"].first
            new(template)
          end
        rescue Fog::Cloudstack::Compute::BadRequest
          nil
        end

        private

        def get_filter_options(filters)
          default_filter = {
              'projectfilter' => 'self'
          }
          default_filter.merge(filters)
        end
      end
    end
  end
end
