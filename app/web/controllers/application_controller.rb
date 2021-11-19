# frozen_string_literal: true

require 'pry'
require 'sinatra'

class ApplicationController < Sinatra::Base
  before do
    content_type 'application/json'
  end

  get '/' do
    { data: { name: 'jus.com.br' } }.to_json
  end

  post '/graphql' do
    body = JSON.parse(request.body.read)
    variables = body['variables']
    query = body['query']

    # this typically holds
    # any request level metadata
    # like authentication or session information
    context = {}

    Schema
      .execute(query, variables: variables, context: context)
      .then(&:to_json)
  end
end
