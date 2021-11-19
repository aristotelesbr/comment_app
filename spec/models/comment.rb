# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Comment, type: :model do
  it 'is valid with valid attributes' do
    expect(Comment.new).to be_valid
  end
end
