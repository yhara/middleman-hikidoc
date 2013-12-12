require 'middleman-core'

require 'hikidoc'
require 'middleman-hikidoc/version'

module Middleman
  module Renderers
    class Hikidoc < Middleman::Extension
      option :plugin_syntax, nil
      option :level, 1
      option :allow_bracket_inline_image, true
      option :use_wiki_name, true
      option :use_not_wiki_name, true

      def initialize(app, options_hash={}, &block)
        super

        @@options = options
      end

      # Retuns a Hash of options given in config.rb
      # FIXME: I don't know proper way to pass options to HikidocTemplate...
      def self.options
        @@options.to_h
      end

      def after_configuration
        app.template_extensions :hd => :html
      end

      # Extend Tilt to handle HikiDoc
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
          @output ||= HikiDoc.to_xhtml(data, Middleman::Renderers::Hikidoc.options)
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
