# frozen_string_literal: true

module Vizier
  # Base implementation for a Collection Presenter.
  #
  # This class can be extended in your application to inherit the convenience
  # of delegating to a collection policy's resolved scope and having a default
  # `present` method available for wrapping other objects according to the
  # configured factory.  To specify a factory, override `presenter_factory`.
  class CollectionPresenter
    include Enumerable

    def initialize(policy, view, presenter_factory: PresenterFactory.new)
      @policy = policy
      @view = view
      @presenter_factory = presenter_factory
    end

    def each
      resources.each { |resource| yield resource }
    end

    def empty?
      resources.empty?
    end

    protected

    def resources
      @resources ||= policy.resolve.map do |resource|
        present(resource)
      end
    end

    def present(resource)
      presenter_factory[resource, policy.user, view]
    end

    attr_reader :policy, :view, :presenter_factory
  end
end
