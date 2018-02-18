# frozen_string_literal: true

module Vizier
  # This is a basic/dummy policy that can be used as a default.
  # There is no hard dependency on Checkpoint, but it has the same
  # interface as a minimal resource policy.
  class ReadOnlyPolicy
    attr_reader :user, :resource

    def initialize(user, resource)
      @user     = user
      @resource = resource
    end

    def show?
      true
    end

    def authorize!(action, message = nil)
      raise NotAuthorizedError, message unless send(action)
    end
  end
end
