module Fog
  module Compute
    class Cloudstack
      class Real

        # Get a vnc console for an server.
        #
        # === Parameters
        # * server_id <~String> - The ID of the server.
        # === Returns
        # * response <~Excon::Response>:
        #   * body <~Hash>:
        #     * url <~String>
        def get_vnc_console(server_id)
          params = { cmd: 'access', vm: server_id }

          if has_session?
            params, headers = authorize_session(params)
          elsif has_keys?
            params, headers = authorize_api_keys(params)
          end

          generic_connection('/client/console').request({
              :query => params,
              :headers => headers,
              :method => 'GET',
              :expects => 200
          }).body

        rescue Excon::Errors::HTTPStatusError => error
          raise Fog::Compute::Cloudstack::Error, error.response.body
        end

      end
    end
  end
end
