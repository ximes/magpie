module Atoms::Matchers
  class CssSelector < Atoms::Rule
    attr_accessor :selector

    def accessible_options
      [:selector]
    end
  end
end
