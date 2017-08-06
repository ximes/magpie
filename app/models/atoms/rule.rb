module Atoms
  class Rule
    MODULE_NAME = "Atoms"

    def initialize(options = {})
      options.each do |key, option|
        instance_variable_set("@#{key}", option) if accessible_options.include? key
      end
    end

    def self.type
      (self.name.split("::").tap(&:pop) - [MODULE_NAME]).join("::")
    end

    def execute
      raise "Parent Atom is not executable"
    end

    def accessible_options
      []
    end
  end
end
