module Jekyll
  module Checkbox
    def checkboxed(text)
      text.gsub(%r{\[\]}i, '<input class="checkbox" type="checkbox" />')
    end
  end
end

Liquid::Template.register_filter(Jekyll::Checkbox)