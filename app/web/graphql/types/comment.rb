# frozen_string_literal: true

require_relative 'base_object'

module Types
  class Comment < Types::BaseObject
    description 'Comment Object Type'

    field :id, ID, null: false
    field :text, String, null: true
    field :author, String, null: true
  end
end
