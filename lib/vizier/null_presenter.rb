# frozen_string_literal: true

module Vizier
  # Simple pass-through presenter that serves as a default.
  #
  # We may want to use something other than `.new` so this
  # can actually return the object rather than a new instance
  # of itself.
  class NullPresenter < SimpleDelegator
    def initialize(object, *)
      __setobj__ object
    end
  end
end
