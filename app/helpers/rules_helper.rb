module RulesHelper
  def rule_list_with_children(rule)
    output = "<li class='selected-rule bg-#{class_by_atom(rule.atom.class_name.constantize.type)} #{"disabled-rule" unless rule.enabled} #{"mjs-nestedSortable-no-nesting" unless rule.nestable?}' data-id='#{rule.id}'>"
    output += rule.atom_instance.render_inline

    if rule.children.any?
      output += "<ol>"
      rule.children.each do |child_rule|
        output += rule_list_with_children child_rule
      end
      output += "</ol>"
    end
    output += "</li>"
  end

  def rule_with_template(rule)
    output = "<p>#{ rule.name }</p>"
    output += "<div class='template collapse'><ol>"
    output += "<li class='selected-rule bg-#{class_by_atom(rule.class_name.constantize.type)} #{"mjs-nestedSortable-no-nesting" unless rule.class_name.constantize.nestable?}' data-id='#{rule.id}'>"
    output += rule.class_name.constantize.new.render_inline
    output += "</li></ol>"
    output += "</div>"
  end

  def class_by_atom(type)
    case type
    when /event/i
      "blue"
    when /matcher/i
      "orange"
    when /marker/i
      "blue-sky"
    when /pageaction/i
      "green"
    when /value/i
      "purple"
    when /shared/i
      "red"
    when /form/i
      "white"
    end
  end
end
