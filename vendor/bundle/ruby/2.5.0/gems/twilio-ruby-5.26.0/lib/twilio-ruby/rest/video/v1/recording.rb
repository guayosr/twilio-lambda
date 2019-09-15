##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Video < Domain
      class V1 < Version
        class RecordingList < ListResource
          ##
          # Initialize the RecordingList
          # @param [Version] version Version that contains the resource
          # @return [RecordingList] RecordingList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Recordings"
          end

          ##
          # Lists RecordingInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [recording.Status] status Only show Recordings with the given status.
          # @param [String] source_sid Only show the Recordings with the given source Sid
          #   (you can use this to filter Recordings by `TrackSid` for Video Room Recordings.
          # @param [String] grouping_sid Only show Recordings that have this GroupingSid,
          #   which may include a ParticipantSid and/or a RoomSid.
          # @param [Time] date_created_after Only show Recordings that started on or after
          #   this ISO8601 date-time with timezone, given as `YYYY-MM-DDThh:mm:ss+|-hh:mm` or
          #   `YYYY-MM-DDThh:mm:ssZ`.
          # @param [Time] date_created_before Only show Recordings that started before this
          #   ISO8601 date-time with timezone, given as `YYYY-MM-DDThh:mm:ss+|-hh:mm` or
          #   `YYYY-MM-DDThh:mm:ssZ`.
          # @param [recording.Type] media_type Only show Recordings that have this media
          #   type. Can be either `audio` or `video`.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records.  If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Array] Array of up to limit results
          def list(status: :unset, source_sid: :unset, grouping_sid: :unset, date_created_after: :unset, date_created_before: :unset, media_type: :unset, limit: nil, page_size: nil)
            self.stream(
                status: status,
                source_sid: source_sid,
                grouping_sid: grouping_sid,
                date_created_after: date_created_after,
                date_created_before: date_created_before,
                media_type: media_type,
                limit: limit,
                page_size: page_size
            ).entries
          end

          ##
          # Streams RecordingInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [recording.Status] status Only show Recordings with the given status.
          # @param [String] source_sid Only show the Recordings with the given source Sid
          #   (you can use this to filter Recordings by `TrackSid` for Video Room Recordings.
          # @param [String] grouping_sid Only show Recordings that have this GroupingSid,
          #   which may include a ParticipantSid and/or a RoomSid.
          # @param [Time] date_created_after Only show Recordings that started on or after
          #   this ISO8601 date-time with timezone, given as `YYYY-MM-DDThh:mm:ss+|-hh:mm` or
          #   `YYYY-MM-DDThh:mm:ssZ`.
          # @param [Time] date_created_before Only show Recordings that started before this
          #   ISO8601 date-time with timezone, given as `YYYY-MM-DDThh:mm:ss+|-hh:mm` or
          #   `YYYY-MM-DDThh:mm:ssZ`.
          # @param [recording.Type] media_type Only show Recordings that have this media
          #   type. Can be either `audio` or `video`.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit. Default is no limit.
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records. If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(status: :unset, source_sid: :unset, grouping_sid: :unset, date_created_after: :unset, date_created_before: :unset, media_type: :unset, limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)

            page = self.page(
                status: status,
                source_sid: source_sid,
                grouping_sid: grouping_sid,
                date_created_after: date_created_after,
                date_created_before: date_created_before,
                media_type: media_type,
                page_size: limits[:page_size],
            )

            @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
          end

          ##
          # When passed a block, yields RecordingInstance records from the API.
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
          # Retrieve a single page of RecordingInstance records from the API.
          # Request is executed immediately.
          # @param [recording.Status] status Only show Recordings with the given status.
          # @param [String] source_sid Only show the Recordings with the given source Sid
          #   (you can use this to filter Recordings by `TrackSid` for Video Room Recordings.
          # @param [String] grouping_sid Only show Recordings that have this GroupingSid,
          #   which may include a ParticipantSid and/or a RoomSid.
          # @param [Time] date_created_after Only show Recordings that started on or after
          #   this ISO8601 date-time with timezone, given as `YYYY-MM-DDThh:mm:ss+|-hh:mm` or
          #   `YYYY-MM-DDThh:mm:ssZ`.
          # @param [Time] date_created_before Only show Recordings that started before this
          #   ISO8601 date-time with timezone, given as `YYYY-MM-DDThh:mm:ss+|-hh:mm` or
          #   `YYYY-MM-DDThh:mm:ssZ`.
          # @param [recording.Type] media_type Only show Recordings that have this media
          #   type. Can be either `audio` or `video`.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of RecordingInstance
          def page(status: :unset, source_sid: :unset, grouping_sid: :unset, date_created_after: :unset, date_created_before: :unset, media_type: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
            params = Twilio::Values.of({
                'Status' => status,
                'SourceSid' => source_sid,
                'GroupingSid' => Twilio.serialize_list(grouping_sid) { |e| e },
                'DateCreatedAfter' => Twilio.serialize_iso8601_datetime(date_created_after),
                'DateCreatedBefore' => Twilio.serialize_iso8601_datetime(date_created_before),
                'MediaType' => media_type,
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })
            response = @version.page(
                'GET',
                @uri,
                params
            )
            RecordingPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of RecordingInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of RecordingInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            RecordingPage.new(@version, response, @solution)
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Video.V1.RecordingList>'
          end
        end

        class RecordingPage < Page
          ##
          # Initialize the RecordingPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [RecordingPage] RecordingPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of RecordingInstance
          # @param [Hash] payload Payload response from the API
          # @return [RecordingInstance] RecordingInstance
          def get_instance(payload)
            RecordingInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Video.V1.RecordingPage>'
          end
        end

        class RecordingContext < InstanceContext
          ##
          # Initialize the RecordingContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The Recording Sid that uniquely identifies the Recording to
          #   fetch.
          # @return [RecordingContext] RecordingContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid, }
            @uri = "/Recordings/#{@solution[:sid]}"
          end

          ##
          # Fetch a RecordingInstance
          # @return [RecordingInstance] Fetched RecordingInstance
          def fetch
            params = Twilio::Values.of({})

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            RecordingInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Deletes the RecordingInstance
          # @return [Boolean] true if delete succeeds, false otherwise
          def delete
            @version.delete('delete', @uri)
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Video.V1.RecordingContext #{context}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Video.V1.RecordingContext #{context}>"
          end
        end

        class RecordingInstance < InstanceResource
          ##
          # Initialize the RecordingInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The Recording Sid that uniquely identifies the Recording to
          #   fetch.
          # @return [RecordingInstance] RecordingInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'account_sid' => payload['account_sid'],
                'status' => payload['status'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'sid' => payload['sid'],
                'source_sid' => payload['source_sid'],
                'size' => payload['size'].to_i,
                'url' => payload['url'],
                'type' => payload['type'],
                'duration' => payload['duration'] == nil ? payload['duration'] : payload['duration'].to_i,
                'container_format' => payload['container_format'],
                'codec' => payload['codec'],
                'grouping_sids' => payload['grouping_sids'],
                'track_name' => payload['track_name'],
                'offset' => payload['offset'].to_i,
                'links' => payload['links'],
            }

            # Context
            @instance_context = nil
            @params = {'sid' => sid || @properties['sid'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [RecordingContext] RecordingContext for this RecordingInstance
          def context
            unless @instance_context
              @instance_context = RecordingContext.new(@version, @params['sid'], )
            end
            @instance_context
          end

          ##
          # @return [String] Twilio Account SID.
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [recording.Status] The status of the Recording.
          def status
            @properties['status']
          end

          ##
          # @return [Time] Date when the media recording began writing.
          def date_created
            @properties['date_created']
          end

          ##
          # @return [String] A 34-character string that uniquely identifies this Recording.
          def sid
            @properties['sid']
          end

          ##
          # @return [String] A 34-character string that uniquely identifies the source of this Recording.
          def source_sid
            @properties['source_sid']
          end

          ##
          # @return [String] Size of the recorded track, in bytes.
          def size
            @properties['size']
          end

          ##
          # @return [String] The absolute URL for this resource.
          def url
            @properties['url']
          end

          ##
          # @return [recording.Type] Indicates the media type for this recording.
          def type
            @properties['type']
          end

          ##
          # @return [String] Duration of the Recording in seconds.
          def duration
            @properties['duration']
          end

          ##
          # @return [recording.Format] The file format for this Recording.
          def container_format
            @properties['container_format']
          end

          ##
          # @return [recording.Codec] The codec used to encode the track.
          def codec
            @properties['codec']
          end

          ##
          # @return [Hash] A list of Sids related to this Recording.
          def grouping_sids
            @properties['grouping_sids']
          end

          ##
          # @return [String] The name that was given to the source track of this recording.
          def track_name
            @properties['track_name']
          end

          ##
          # @return [String] Offset in milliseconds for this track.
          def offset
            @properties['offset']
          end

          ##
          # @return [String] The links
          def links
            @properties['links']
          end

          ##
          # Fetch a RecordingInstance
          # @return [RecordingInstance] Fetched RecordingInstance
          def fetch
            context.fetch
          end

          ##
          # Deletes the RecordingInstance
          # @return [Boolean] true if delete succeeds, false otherwise
          def delete
            context.delete
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Video.V1.RecordingInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Video.V1.RecordingInstance #{values}>"
          end
        end
      end
    end
  end
end