require 'fog/core/collection'
require 'fog/cloudstack/models/compute/volume'

module Fog
  module Compute
    class Cloudstack

      class Volumes < Fog::Collection

        model Fog::Compute::Cloudstack::Volume

        def all(options = {})
          response = service.list_volumes(options)
          volume_data = response["listvolumesresponse"]["volume"] || []
          load(volume_data)
        end

        def get(volume_id)
          if response = service.list_volumes('id' => volume_id)["listvolumesresponse"]["volume"]
            new(response.first)
          end
        rescue Fog::Compute::Cloudstack::BadRequest
          nil
        end
      end

    end
  end
end
