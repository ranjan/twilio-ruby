##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Video
      class V1 < Version
        ##
        # Initialize the V1 version of Video
        def initialize(domain)
          super
          @version = 'v1'
          @compositions = nil
          @composition_settings = nil
          @recordings = nil
          @recording_settings = nil
          @rooms = nil
        end

        ##
        # @param [String] sid The Composition Sid that uniquely identifies the Composition
        #   to fetch.
        # @return [Twilio::REST::Video::V1::CompositionContext] if sid was passed.
        # @return [Twilio::REST::Video::V1::CompositionList]
        def compositions(sid=:unset)
          if sid.nil?
            raise ArgumentError, 'sid cannot be nil'
          elsif sid == :unset
            @compositions ||= CompositionList.new self
          else
            CompositionContext.new(self, sid)
          end
        end

        ##
        # @return [Twilio::REST::Video::V1::CompositionSettingsContext]
        def composition_settings
          @composition_settings ||= CompositionSettingsContext.new self
        end

        ##
        # @param [String] sid The Recording Sid that uniquely identifies the Recording to
        #   fetch.
        # @return [Twilio::REST::Video::V1::RecordingContext] if sid was passed.
        # @return [Twilio::REST::Video::V1::RecordingList]
        def recordings(sid=:unset)
          if sid.nil?
            raise ArgumentError, 'sid cannot be nil'
          elsif sid == :unset
            @recordings ||= RecordingList.new self
          else
            RecordingContext.new(self, sid)
          end
        end

        ##
        # @return [Twilio::REST::Video::V1::RecordingSettingsContext]
        def recording_settings
          @recording_settings ||= RecordingSettingsContext.new self
        end

        ##
        # @param [String] sid The sid
        # @return [Twilio::REST::Video::V1::RoomContext] if sid was passed.
        # @return [Twilio::REST::Video::V1::RoomList]
        def rooms(sid=:unset)
          if sid.nil?
            raise ArgumentError, 'sid cannot be nil'
          elsif sid == :unset
            @rooms ||= RoomList.new self
          else
            RoomContext.new(self, sid)
          end
        end

        ##
        # Provide a user friendly representation
        def to_s
          '<Twilio::REST::Video::V1>'
        end
      end
    end
  end
end