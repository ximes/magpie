module Atoms::Markers
  class Failed < Atoms::Rule
    def self.nestable?; false; end
  end
end
