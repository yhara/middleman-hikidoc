require 'middleman-core'

require 'hikidoc'
require 'middleman-hikidoc/version'

module Middleman
  module Renderers
    class Hikidoc < Middleman::Extension
      def after_configuration
        app.template_extensions :hd => :html
      end

      class HikidocTemplate < ::Tilt::Template
        def self.engine_initialized?
          defined? ::HikiDoc
        end

        def initialize_engine
          require_template_library 'hikidoc'
        end

        def prepare
          @output = nil
        end

        def evaluate(scope, locals, &block)
          @output ||= HikiDoc.to_xhtml(data)
        end

        def allows_script?
          false
        end
      end

      ::Tilt.register HikidocTemplate, 'hd'
    end
  end
end


::Middleman::Extensions.register(:hikidoc, Middleman::Renderers::Hikidoc)

