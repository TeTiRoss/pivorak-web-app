# frozen_string_literal: true

module Api
  module Types
    class EventType < BaseType
      description 'Pivorak member **profile** info'

      field :id,           ID,                              'Event ID',                 null: false
      field :status,       String,                          'Event status',             null: false
      field :title,        String,                          'Title of the event',       null: false
      field :description,  String,                          'Description of the event', null: true
      field :agenda,       String,                          'Agenda of the event',      null: true
      field :startedAt,    GraphQL::Types::ISO8601DateTime, 'When event starts at',     null: false
      field :finishedAt,   GraphQL::Types::ISO8601DateTime, 'When event finished at',   null: false
    end
  end
end
