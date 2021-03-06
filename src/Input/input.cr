private module Util
    # Copy all constants from the namespace into the current namespace
    macro extract(from)
      {% for c in from.resolve.constants %}
        # :nodoc:
        {{c}} = {{from}}::{{c}}{% if c.id.ends_with? "Count" %}.value{% end %}
      {% end %}
    end
end

module CRGSS
    module Input
        # Grab the keys from the SFML Keyboard module
        Util.extract SF::Keyboard::Key
    end
end