require 'fog/core/collection'
require 'fog/cloudstack/models/compute/snapshot'

module Fog
  module Compute
    class Cloudstack

      class Snapshots < Fog::Collection

        model Fog::Compute::Cloudstack::Snapshot

        def all(options = {})
          data = service.list_snapshots(options)["listsnapshotsresponse"]["snapshot"] || []
          load(data)
        end

        def get(snapshot_id)
          respond = service.list_snapshots('id' => snapshot_id)["listsnapshotsresponse"]["snapshot"]

          new(respond.first) if respond
        end
      end

    end
  end
end
