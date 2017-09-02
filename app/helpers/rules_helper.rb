module RulesHelper
  def rule_list_with_children(rule)
    output = "<li data-id='#{rule.id}' id='rule_#{rule.id}#{rand(100000)}'><div class='#{"mjs-nestedSortable-error" unless rule.valid?}'>#{rule.id}. #{rule.atom.name}</div>"
    if rule.children.any?
      output += "<ol>"
      rule.children.each do |child_rule|
        output += rule_list_with_children child_rule
      end
      output += "</ol>"
    end
    output += "</li>"
  end
end
