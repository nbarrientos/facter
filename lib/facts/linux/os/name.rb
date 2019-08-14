# frozen_string_literal: true

module Facter
  module Linux
    class OsName
      FACT_NAME = 'os.name'
      @aliases = []

      def initialize(*args)
        @log = Logging.logger[self]
        @args = args
        @log.debug 'Dispatching to resolve: ' + args.inspect
      end

      def call_the_resolver!
        fact_value = OsResolver.resolve(:name)

        Fact.new(FACT_NAME, fact_value)
      end
    end
  end
end
