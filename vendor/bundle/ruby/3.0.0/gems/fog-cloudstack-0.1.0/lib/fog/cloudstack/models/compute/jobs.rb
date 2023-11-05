require 'fog/core/collection'
require 'fog/cloudstack/models/compute/job'

module Fog
  module Cloudstack
    class Compute
      class Jobs < Fog::Collection
        model Fog::Cloudstack::Compute::Job

        def all
          data = service.list_async_jobs["listasyncjobsresponse"]["asyncjobs"] || []
          load(data)
        end

        def get(job_id)
          if job = service.query_async_job_result('jobid' => job_id)["queryasyncjobresultresponse"]
            new(job)
          end
        rescue Fog::Cloudstack::Compute::BadRequest
          nil
        end
      end
    end
  end
end
