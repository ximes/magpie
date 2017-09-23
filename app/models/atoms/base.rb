require "capybara/dsl"

module Atoms
  class Base < Cell::ViewModel
    MODULE_NAME = "Atoms"

    include Capybara::DSL
    include ::Cell::Erb

    self.view_paths = ["app/views"]

    def initialize(enabled = true, options = {})
      options.each do |key, option|
        instance_variable_set("@#{key}", option) if accessible_options.include? key.to_sym
      end
      @enabled = enabled
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

    def self.iterates?
      false
    end

    def self.nestable?
      true
    end

    def self.type
      (self.name.split("::").tap(&:pop) - [MODULE_NAME]).join("::")
    end

    # view/model methods
    def update_url
      Rails.application.routes.url_helpers.rules_path
    end

    def show
      @rule = self
      render
    end

    def atom_actions
      render partial: "atoms/shared/actions"
    end

    def render_inline
      # it renders the cell. TODO, is there any cell's method for that?
      self.()
    end
  end
end
