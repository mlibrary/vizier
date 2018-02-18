# frozen_string_literal: true

module Vizier
  # A base implementation of a default presenter configuration, used by
  # by PresenterFactory to provide a fall-through for unmapped types.
  #
  # This uses `NullPresenter` and `ReadOnlyPolicy` to have generic, fully
  # delegating presenters with a `show?` permission passing unconditionally.
  class DefaultPresenterConfig
    attr_reader :config_type

    def initialize(config_type)
      @config_type = config_type
    end

    def for(type)
      config_type.new(type, NullPresenter, ReadOnlyPolicy)
    end
  end
end
