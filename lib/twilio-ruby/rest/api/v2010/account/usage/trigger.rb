##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class UsageList < ListResource
            class TriggerList < ListResource
              ##
              # Initialize the TriggerList
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid A 34 character string that uniquely identifies this
              #   resource.
              # @return [TriggerList] TriggerList
              def initialize(version, account_sid: nil)
                super(version)

                # Path Solution
                @solution = {account_sid: account_sid}
                @uri = "/Accounts/#{@solution[:account_sid]}/Usage/Triggers.json"
              end

              ##
              # Retrieve a single page of TriggerInstance records from the API.
              # Request is executed immediately.
              # @param [String] callback_url Twilio will make a request to this url when the
              #   trigger fires.
              # @param [String] trigger_value The trigger will fire when usage reaches this
              #   value.  For convenience, you can use an offset like `+30`, which tells Twilio to
              #   create the UsageTrigger with its TriggerValue 30 units higher than the current
              #   usage. (just be sure to urlencode the `+` as `%2B`).
              # @param [trigger.UsageCategory] usage_category The trigger will watch this usage
              #   category.  One of the supported [usage
              #   categories](https://www.twilio.com/docs/api/rest/usage-records#usage-categories).
              # @param [String] callback_method Twilio will use this HTTP method when making a
              #   request to the CallbackUrl.  `GET` or `POST`.  The default is `POST`.
              # @param [String] friendly_name A human readable description of the new trigger. 
              #   Maximum 64 characters.
              # @param [trigger.Recurring] recurring How this trigger recurs. Empty for
              #   non-recurring triggers. One of `daily`, `monthly`, or `yearly` for recurring
              #   triggers.  A trigger will only fire once during each recurring period. 
              #   Recurring periods are in GMT.
              # @param [trigger.TriggerField] trigger_by The field in the
              #   [UsageRecord](https://www.twilio.com/docs/api/rest/usage-records) that will fire
              #   the trigger.  One of `count`, `usage`, or `price` as described in the
              #   [UsageRecords
              #   documentation](https://www.twilio.com/docs/api/rest/usage-records#usage-count-price).  The default is `usage`.
              # @return [TriggerInstance] Newly created TriggerInstance
              def create(callback_url: nil, trigger_value: nil, usage_category: nil, callback_method: :unset, friendly_name: :unset, recurring: :unset, trigger_by: :unset)
                data = Twilio::Values.of({
                    'CallbackUrl' => callback_url,
                    'TriggerValue' => trigger_value,
                    'UsageCategory' => usage_category,
                    'CallbackMethod' => callback_method,
                    'FriendlyName' => friendly_name,
                    'Recurring' => recurring,
                    'TriggerBy' => trigger_by,
                })

                payload = @version.create(
                    'POST',
                    @uri,
                    data: data
                )

                TriggerInstance.new(@version, payload, account_sid: @solution[:account_sid], )
              end

              ##
              # Lists TriggerInstance records from the API as a list.
              # Unlike stream(), this operation is eager and will load `limit` records into
              # memory before returning.
              # @param [trigger.Recurring] recurring Only show UsageTriggers that count over
              #   this interval.  One of `daily`, `monthly`, or `yearly`.  To retrieve
              #   non-recurring triggers, leave this empty or use `alltime`.
              # @param [trigger.TriggerField] trigger_by Only show UsageTriggers that trigger by
              #   this field in the UsageRecord.  Must be one of: `count`, `usage`, or `price` as
              #   described in the [UsageRecords
              #   documentation](https://www.twilio.com/docs/api/rest/usage-records#usage-count-price).
              # @param [trigger.UsageCategory] usage_category Only show UsageTriggers that watch
              #   this usage category.  Must be one of the supported [usage
              #   categories](https://www.twilio.com/docs/api/rest/usage-records#usage-categories).
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit.  Default is no limit
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records.  If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Array] Array of up to limit results
              def list(recurring: :unset, trigger_by: :unset, usage_category: :unset, limit: nil, page_size: nil)
                self.stream(
                    recurring: recurring,
                    trigger_by: trigger_by,
                    usage_category: usage_category,
                    limit: limit,
                    page_size: page_size
                ).entries
              end

              ##
              # Streams TriggerInstance records from the API as an Enumerable.
              # This operation lazily loads records as efficiently as possible until the limit
              # is reached.
              # @param [trigger.Recurring] recurring Only show UsageTriggers that count over
              #   this interval.  One of `daily`, `monthly`, or `yearly`.  To retrieve
              #   non-recurring triggers, leave this empty or use `alltime`.
              # @param [trigger.TriggerField] trigger_by Only show UsageTriggers that trigger by
              #   this field in the UsageRecord.  Must be one of: `count`, `usage`, or `price` as
              #   described in the [UsageRecords
              #   documentation](https://www.twilio.com/docs/api/rest/usage-records#usage-count-price).
              # @param [trigger.UsageCategory] usage_category Only show UsageTriggers that watch
              #   this usage category.  Must be one of the supported [usage
              #   categories](https://www.twilio.com/docs/api/rest/usage-records#usage-categories).
              # @param [Integer] limit Upper limit for the number of records to return. stream()
              #    guarantees to never return more than limit. Default is no limit.
              # @param [Integer] page_size Number of records to fetch per request, when
              #    not set will use the default value of 50 records. If no page_size is defined
              #    but a limit is defined, stream() will attempt to read the limit with the most
              #    efficient page size, i.e. min(limit, 1000)
              # @return [Enumerable] Enumerable that will yield up to limit results
              def stream(recurring: :unset, trigger_by: :unset, usage_category: :unset, limit: nil, page_size: nil)
                limits = @version.read_limits(limit, page_size)

                page = self.page(
                    recurring: recurring,
                    trigger_by: trigger_by,
                    usage_category: usage_category,
                    page_size: limits[:page_size],
                )

                @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
              end

              ##
              # When passed a block, yields TriggerInstance records from the API.
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
              # Retrieve a single page of TriggerInstance records from the API.
              # Request is executed immediately.
              # @param [trigger.Recurring] recurring Only show UsageTriggers that count over
              #   this interval.  One of `daily`, `monthly`, or `yearly`.  To retrieve
              #   non-recurring triggers, leave this empty or use `alltime`.
              # @param [trigger.TriggerField] trigger_by Only show UsageTriggers that trigger by
              #   this field in the UsageRecord.  Must be one of: `count`, `usage`, or `price` as
              #   described in the [UsageRecords
              #   documentation](https://www.twilio.com/docs/api/rest/usage-records#usage-count-price).
              # @param [trigger.UsageCategory] usage_category Only show UsageTriggers that watch
              #   this usage category.  Must be one of the supported [usage
              #   categories](https://www.twilio.com/docs/api/rest/usage-records#usage-categories).
              # @param [String] page_token PageToken provided by the API
              # @param [Integer] page_number Page Number, this value is simply for client state
              # @param [Integer] page_size Number of records to return, defaults to 50
              # @return [Page] Page of TriggerInstance
              def page(recurring: :unset, trigger_by: :unset, usage_category: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
                params = Twilio::Values.of({
                    'Recurring' => recurring,
                    'TriggerBy' => trigger_by,
                    'UsageCategory' => usage_category,
                    'PageToken' => page_token,
                    'Page' => page_number,
                    'PageSize' => page_size,
                })
                response = @version.page(
                    'GET',
                    @uri,
                    params
                )
                TriggerPage.new(@version, response, @solution)
              end

              ##
              # Retrieve a single page of TriggerInstance records from the API.
              # Request is executed immediately.
              # @param [String] target_url API-generated URL for the requested results page
              # @return [Page] Page of TriggerInstance
              def get_page(target_url)
                response = @version.domain.request(
                    'GET',
                    target_url
                )
                TriggerPage.new(@version, response, @solution)
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Api.V2010.TriggerList>'
              end
            end

            class TriggerPage < Page
              ##
              # Initialize the TriggerPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [TriggerPage] TriggerPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of TriggerInstance
              # @param [Hash] payload Payload response from the API
              # @return [TriggerInstance] TriggerInstance
              def get_instance(payload)
                TriggerInstance.new(@version, payload, account_sid: @solution[:account_sid], )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Api.V2010.TriggerPage>'
              end
            end

            class TriggerContext < InstanceContext
              ##
              # Initialize the TriggerContext
              # @param [Version] version Version that contains the resource
              # @param [String] account_sid The account_sid
              # @param [String] sid The usage-trigger Sid that uniquely identifies this resource
              # @return [TriggerContext] TriggerContext
              def initialize(version, account_sid, sid)
                super(version)

                # Path Solution
                @solution = {account_sid: account_sid, sid: sid, }
                @uri = "/Accounts/#{@solution[:account_sid]}/Usage/Triggers/#{@solution[:sid]}.json"
              end

              ##
              # Fetch a TriggerInstance
              # @return [TriggerInstance] Fetched TriggerInstance
              def fetch
                params = Twilio::Values.of({})

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                TriggerInstance.new(@version, payload, account_sid: @solution[:account_sid], sid: @solution[:sid], )
              end

              ##
              # Update the TriggerInstance
              # @param [String] callback_method The HTTP method Twilio will use when making a
              #   request to the CallbackUrl.  `GET` or `POST`.
              # @param [String] callback_url Twilio will make a request to this url when the
              #   trigger fires.
              # @param [String] friendly_name A user-specified, human-readable name for the
              #   trigger.
              # @return [TriggerInstance] Updated TriggerInstance
              def update(callback_method: :unset, callback_url: :unset, friendly_name: :unset)
                data = Twilio::Values.of({
                    'CallbackMethod' => callback_method,
                    'CallbackUrl' => callback_url,
                    'FriendlyName' => friendly_name,
                })

                payload = @version.update(
                    'POST',
                    @uri,
                    data: data,
                )

                TriggerInstance.new(@version, payload, account_sid: @solution[:account_sid], sid: @solution[:sid], )
              end

              ##
              # Deletes the TriggerInstance
              # @return [Boolean] true if delete succeeds, true otherwise
              def delete
                @version.delete('delete', @uri)
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Api.V2010.TriggerContext #{context}>"
              end
            end

            class TriggerInstance < InstanceResource
              ##
              # Initialize the TriggerInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] account_sid A 34 character string that uniquely identifies this
              #   resource.
              # @param [String] sid The usage-trigger Sid that uniquely identifies this resource
              # @return [TriggerInstance] TriggerInstance
              def initialize(version, payload, account_sid: nil, sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'api_version' => payload['api_version'],
                    'callback_method' => payload['callback_method'],
                    'callback_url' => payload['callback_url'],
                    'current_value' => payload['current_value'],
                    'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                    'date_fired' => Twilio.deserialize_rfc2822(payload['date_fired']),
                    'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                    'friendly_name' => payload['friendly_name'],
                    'recurring' => payload['recurring'],
                    'sid' => payload['sid'],
                    'trigger_by' => payload['trigger_by'],
                    'trigger_value' => payload['trigger_value'],
                    'uri' => payload['uri'],
                    'usage_category' => payload['usage_category'],
                    'usage_record_uri' => payload['usage_record_uri'],
                }

                # Context
                @instance_context = nil
                @params = {'account_sid' => account_sid, 'sid' => sid || @properties['sid'], }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [TriggerContext] TriggerContext for this TriggerInstance
              def context
                unless @instance_context
                  @instance_context = TriggerContext.new(@version, @params['account_sid'], @params['sid'], )
                end
                @instance_context
              end

              ##
              # @return [String] The account this trigger monitors.
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [String] The api_version
              def api_version
                @properties['api_version']
              end

              ##
              # @return [String] HTTP method to use with callback_url
              def callback_method
                @properties['callback_method']
              end

              ##
              # @return [String] URL Twilio will request when the trigger fires
              def callback_url
                @properties['callback_url']
              end

              ##
              # @return [String] The current value of the field the trigger is watching.
              def current_value
                @properties['current_value']
              end

              ##
              # @return [Time] The date this resource was created
              def date_created
                @properties['date_created']
              end

              ##
              # @return [Time] The date the trigger was last fired
              def date_fired
                @properties['date_fired']
              end

              ##
              # @return [Time] The date this resource was last updated
              def date_updated
                @properties['date_updated']
              end

              ##
              # @return [String] A user-specified, human-readable name for the trigger.
              def friendly_name
                @properties['friendly_name']
              end

              ##
              # @return [trigger.Recurring] How this trigger recurs
              def recurring
                @properties['recurring']
              end

              ##
              # @return [String] The trigger's unique Sid
              def sid
                @properties['sid']
              end

              ##
              # @return [trigger.TriggerField] The field in the UsageRecord that fires the trigger
              def trigger_by
                @properties['trigger_by']
              end

              ##
              # @return [String] the value at which the trigger will fire
              def trigger_value
                @properties['trigger_value']
              end

              ##
              # @return [String] The URI for this resource
              def uri
                @properties['uri']
              end

              ##
              # @return [trigger.UsageCategory] The usage category the trigger watches
              def usage_category
                @properties['usage_category']
              end

              ##
              # @return [String] The URI of the UsageRecord this trigger is watching
              def usage_record_uri
                @properties['usage_record_uri']
              end

              ##
              # Fetch a TriggerInstance
              # @return [TriggerInstance] Fetched TriggerInstance
              def fetch
                context.fetch
              end

              ##
              # Update the TriggerInstance
              # @param [String] callback_method The HTTP method Twilio will use when making a
              #   request to the CallbackUrl.  `GET` or `POST`.
              # @param [String] callback_url Twilio will make a request to this url when the
              #   trigger fires.
              # @param [String] friendly_name A user-specified, human-readable name for the
              #   trigger.
              # @return [TriggerInstance] Updated TriggerInstance
              def update(callback_method: :unset, callback_url: :unset, friendly_name: :unset)
                context.update(
                    callback_method: callback_method,
                    callback_url: callback_url,
                    friendly_name: friendly_name,
                )
              end

              ##
              # Deletes the TriggerInstance
              # @return [Boolean] true if delete succeeds, true otherwise
              def delete
                context.delete
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Api.V2010.TriggerInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Api.V2010.TriggerInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end