# frozen_string_literal: true

module Facter
  module Resolvers
    module Aix
      class LoadAverages < BaseResolver
        init_resolver

        class << self
          private

          def post_resolve(fact_name, _options)
            @fact_list.fetch(fact_name) { read_load_averages(fact_name) }
          end

          def read_load_averages(fact_name)
            require_relative 'ffi/ffi_helper'
            @fact_list[:load_averages] = {}.tap do |h|
              h['1m'], h['5m'], h['15m'] = FfiHelper.read_load_averages
            end

            @fact_list[fact_name]
          end
        end
      end
    end
  end
end
