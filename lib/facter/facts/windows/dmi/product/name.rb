# frozen_string_literal: true

module Facts
  module Windows
    module Dmi
      module Product
        class Name
          FACT_NAME = 'dmi.product.name'
          ALIASES = 'productname'

          def call_the_resolver
            fact_value = Facter::Resolvers::DMIComputerSystem.resolve(:name)

            [Facter::ResolvedFact.new(FACT_NAME, fact_value), Facter::ResolvedFact.new(ALIASES, fact_value, :legacy)]
          end
        end
      end
    end
  end
end
