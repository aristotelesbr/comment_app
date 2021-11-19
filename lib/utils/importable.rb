# frozen_string_literal: true

class Importable
  module Mixin
    def Import(value)
      require File.expand_path(value)
    end
  end
end
