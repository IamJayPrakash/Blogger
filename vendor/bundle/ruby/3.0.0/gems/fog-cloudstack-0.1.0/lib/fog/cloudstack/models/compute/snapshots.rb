require 'fog/core/collection'
require 'fog/cloudstack/models/compute/snapshot'

module Fog
  module Cloudstack
    class Compute
      class Snapshots < Fog::Collection
        model Fog::Cloudstack::Compute::Snapshot

        def all(attributes = {})
          response = service.list_snapshots(attributes)
          data = response["listsnapshotsresponse"]["snapshot"] || []
          load(data)
        end

        def get(snapshot_id)
          snapshot = service.list_snapshots('id' => snapshot_id)["listsnapshotsresponse"]["snapshot"].first
          new(snapshot) if snapshot
        end
      end
    end
  end
end
