##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Serverless < Domain
      class V1 < Version
        class ServiceContext < InstanceContext
          class FunctionContext < InstanceContext
            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class FunctionVersionList < ListResource
              ##
              # Initialize the FunctionVersionList
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The unique SID identifier of the Service for this
              #   Function Version.
              # @param [String] function_sid The unique SID identifier of the Function that is
              #   the parent for this Function Version.
              # @return [FunctionVersionList] FunctionVersionList
              def initialize(version, service_sid: nil, function_sid: nil)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, function_sid: function_sid}
                @uri = "/Services/#{@solution[:service_sid]}/Functions/#{@solution[:function_sid]}/Versions"
              end

              ##
              # Lists FunctionVersionInstance records from the API as a list.
              # Unlike stream(), this operation is eager and will load `limit` records into
              # memory before returning.
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit.  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records.  If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Array] Array of up to limit results
              def list(limit: nil, page_size: nil)
                self.stream(limit: limit, page_size: page_size).entries
              end

              ##
              # Streams FunctionVersionInstance records from the API as an Enumerable.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit. Default is no limit.
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records. If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Enumerable] Enumerable that will yield up to limit results
              def stream(limit: nil, page_size: nil)
                limits = @version.read_limits(limit, page_size)

                page = self.page(page_size: limits[:page_size], )

                @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
              end

              ##
              # When passed a block, yields FunctionVersionInstance records from the API.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              def each
                limits = @version.read_limits

                page = self.page(page_size: limits[:page_size], )

                @version.stream(page,
                                limit: limits[:limit],
                                page_limit: limits[:page_limit]).each {|x| yield x}
              end

              ##
              # Retrieve a single page of FunctionVersionInstance records from the API.
              # Request is executed immediately.
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of FunctionVersionInstance
              def page(page_token: :unset, page_number: :unset, page_size: :unset)
                params = Twilio::Values.of({
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })
                response = @version.page(
                    'GET',
                    @uri,
                    params
                )
                FunctionVersionPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of FunctionVersionInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of FunctionVersionInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                FunctionVersionPage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Serverless.V1.FunctionVersionList>'
              end
            end

            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class FunctionVersionPage < Page
              ##
              # Initialize the FunctionVersionPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [FunctionVersionPage] FunctionVersionPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of FunctionVersionInstance
              # @param [Hash] payload Payload response from the API
              # @return [FunctionVersionInstance] FunctionVersionInstance
              def get_instance(payload)
                FunctionVersionInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    function_sid: @solution[:function_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Serverless.V1.FunctionVersionPage>'
              end
            end

            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class FunctionVersionContext < InstanceContext
              ##
              # Initialize the FunctionVersionContext
              # @param [Version] version Version that contains the resource
              # @param [String] service_sid The unique SID identifier of the Service for this
              #   Function Version.
              # @param [String] function_sid The unique SID identifier of the Function that is
              #   the parent for this Function Version.
              # @param [String] sid The unique SID identifier of this Function Version.
              # @return [FunctionVersionContext] FunctionVersionContext
              def initialize(version, service_sid, function_sid, sid)
                super(version)

                # Path Solution
                @solution = {service_sid: service_sid, function_sid: function_sid, sid: sid, }
                @uri = "/Services/#{@solution[:service_sid]}/Functions/#{@solution[:function_sid]}/Versions/#{@solution[:sid]}"
              end

              ##
              # Fetch a FunctionVersionInstance
              # @return [FunctionVersionInstance] Fetched FunctionVersionInstance
              def fetch
                params = Twilio::Values.of({})

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                FunctionVersionInstance.new(
                    @version,
                    payload,
                    service_sid: @solution[:service_sid],
                    function_sid: @solution[:function_sid],
                    sid: @solution[:sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Serverless.V1.FunctionVersionContext #{context}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Serverless.V1.FunctionVersionContext #{context}>"
              end
            end

            ##
            # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
            class FunctionVersionInstance < InstanceResource
              ##
              # Initialize the FunctionVersionInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] service_sid The unique SID identifier of the Service for this
              #   Function Version.
              # @param [String] function_sid The unique SID identifier of the Function that is
              #   the parent for this Function Version.
              # @param [String] sid The unique SID identifier of this Function Version.
              # @return [FunctionVersionInstance] FunctionVersionInstance
              def initialize(version, payload, service_sid: nil, function_sid: nil, sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'sid' => payload['sid'],
                    'account_sid' => payload['account_sid'],
                    'service_sid' => payload['service_sid'],
                    'function_sid' => payload['function_sid'],
                    'path' => payload['path'],
                    'visibility' => payload['visibility'],
                    'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                    'url' => payload['url'],
                }

                # Context
                @instance_context = nil
                @params = {
                    'service_sid' => service_sid,
                    'function_sid' => function_sid,
                    'sid' => sid || @properties['sid'],
                }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [FunctionVersionContext] FunctionVersionContext for this FunctionVersionInstance
              def context
                unless @instance_context
                  @instance_context = FunctionVersionContext.new(
                      @version,
                      @params['service_sid'],
                      @params['function_sid'],
                      @params['sid'],
                  )
                end
                @instance_context
              end

              ##
              # @return [String] Function Version Sid.
              def sid
                @properties['sid']
              end

              ##
              # @return [String] Account Sid.
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] Service Sid.
              def service_sid
                @properties['service_sid']
              end

              ##
              # @return [String] Function Sid.
              def function_sid
                @properties['function_sid']
              end

              ##
              # @return [String] The URL-friendly string by which this Function Version can be referenced.
              def path
                @properties['path']
              end

              ##
              # @return [function_version.Visibility] The access control which determines how the Function Version can be accessed.
              def visibility
                @properties['visibility']
              end

              ##
              # @return [Time] The date that this Function Version was created.
              def date_created
                @properties['date_created']
              end

              ##
              # @return [String] The URL of this Function Version.
              def url
                @properties['url']
              end

              ##
              # Fetch a FunctionVersionInstance
              # @return [FunctionVersionInstance] Fetched FunctionVersionInstance
              def fetch
                context.fetch
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Serverless.V1.FunctionVersionInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Serverless.V1.FunctionVersionInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end