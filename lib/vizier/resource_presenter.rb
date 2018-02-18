# frozen_string_literal: true

module Vizier
  # Base implementation for a Resource Presenter.
  #
  # This class can be extended in your application to inherit the convenience
  # of delegating to a policy's resource and having a default `present` method
  # available for wrapping other objects according to the configured factory.
  # To specify a factory, override `presenter_factory`.
  class ResourcePresenter < SimpleDelegator
    extend Forwardable

    def initialize(policy, view, presenter_factory: PresenterFactory.new)
      @policy = policy
      @view   = view
      @presenter_factory = presenter_factory
      __setobj__ policy.resource
    end

    protected

    def resource
      policy.resource
    end

    def present(object)
      presenter_factory[object, policy.user, view]
    end

    attr_reader :policy, :view, :presenter_factory
  end
end
