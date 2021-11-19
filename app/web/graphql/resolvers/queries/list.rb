# frozen_string_literal: true

module Resolvers
  module Queries
    extend Importable::Mixin
    Import 'app/web/graphql/types/base_resolver'

    class List < Types::BaseResolver
      extend Importable::Mixin
      Import 'app/lib/entities/comment'
      Import 'app/lib/comments/get_all'
      Import 'app/web/graphql/types/comment'

      type [Types::Comment], null: true

      def resolve
        # before
        # Comment.all
        Comments::GetAll.new.call
      end
    end
  end
end
