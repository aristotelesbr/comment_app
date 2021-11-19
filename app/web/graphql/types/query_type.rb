# frozen_string_literal: true

require_relative 'comment'
require_relative 'base_object'
require_relative '../resolvers/queries/list'

class QueryType < Types::BaseObject
  field :comments, resolver: Resolvers::Queries::List
end
