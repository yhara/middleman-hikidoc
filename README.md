# middleman-hikidoc

Middleman plugin for [HikiDoc](http://projects.netlab.jp/hikidoc/?FrontPage.ja),
a text format used by Wiki Engine [Hiki](http://hikiwiki.org/ja/).

## Installation

Add this to Gemfile and run `bundle install`

    gem 'middleman-hikidoc', git: 'https://github.com/yhara/middleman-hikidoc.git'

Then add this to config.rb

    activate :hikidoc

## Options

Map `!` to `h3` instead of `h1`

    activate :hikidoc, level: 3

Use to_html instead of to_xhtml

    activate :hikidoc, format: :html

Other options:

      option :format, :xhtml
      option :plugin_syntax, nil
      option :level, 1
      option :allow_bracket_inline_image, true
      option :use_wiki_name, true
      option :use_not_wiki_name, true

## License 

MIT
