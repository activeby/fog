module Fog
  module Compute
    class Cloudstack

      class Real

        def update_resource_limit(options = {})
          options.merge!('command' => 'updateResourceLimit')

          request(options)
        end
      end

    end
  end
end
