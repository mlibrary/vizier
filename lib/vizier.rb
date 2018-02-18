# frozen_string_literal: true

require 'vizier/version'

# Top level module for Vizier
module Vizier
  # Just the constant for now
end

require 'vizier/null_presenter'
require 'vizier/read_only_policy'

require 'vizier/presenter_config'
require 'vizier/caching_presenter_config'
require 'vizier/default_presenter_config'

require 'vizier/collection_presenter'
require 'vizier/resource_presenter'
require 'vizier/presenter_factory'
