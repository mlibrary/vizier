# frozen_string_literal: true

module Vizier
  # Factory for locating and creating a presenter based on an object's type.
  class PresenterFactory
    # Construct a factory with a mapping of types to their default presenters
    # and policies.
    #
    # @param presenter_map [Hash] the mapping of classes of strings to a pair,
    #   where the first item is the default presenter type, and the second is the
    #   default policy type.
    def initialize(
        presenter_map = {},
        config_type: PresenterConfig,
        default_config: DefaultPresenterConfig.new(config_type))

      @config_type    = config_type
      @default_config = default_config

      @configs = Hash.new do |_configs, type|
        default_config.for(type)
      end

      presenter_map.each do |type, config|
        @configs[type.to_s] = config_type.new(type, config.first, config.last)
      end
    end

    def [](object, user, view)
      configs[object.class.to_s].present(object, user, view)
    end

    private

    attr_accessor :configs, :config_type, :default_config
  end
end
