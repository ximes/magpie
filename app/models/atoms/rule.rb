require "capybara/dsl"

module Atoms
  class Rule < Cell::ViewModel
    MODULE_NAME = "Atoms"

    include Capybara::DSL

    self.view_paths = ["app/views"]

    include ::Cell::Erb

    def initialize(enabled = true, options = {})
      options.each do |key, option|
        instance_variable_set("@#{key}", option) if accessible_options.include? key.to_sym
      end
      @enabled = enabled
    end

    def self.nestable?
      true
    end

    def self.type
      (self.name.split("::").tap(&:pop) - [MODULE_NAME]).join("::")
    end

    def execute
      raise "Parent Atom is not executable"
    end

    def after_execute(*args)
      nil
    end

    def accessible_options
      []
    end

    # view/model methods
    def update_url
      Rails.application.routes.url_helpers.rules_path
    end

    # it renders the cell. TODO, is there any cell's method for that?
    def render_inline
      self.()
    end

    def show
      @rule = self
      render
    end

    def atom_actions
      render partial: "atoms/shared/actions"
    end
  end
end
