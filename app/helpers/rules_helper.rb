module RulesHelper
  def rule_list_with_children(rule)
    # replace with single atom template
    output = "<li class='selected-rule bg-#{class_by_atom(rule.atom.class_name.constantize.type)} #{rule.atom.class_name.constantize.new.custom_css_class} %>' data-id='#{rule.id}'><div class='#{"mjs-nestedSortable-error" unless rule.valid?}'>#{rule.name}</div>"

    if rule.children.any?
      output += "<ol>"
      rule.children.each do |child_rule|
        output += rule_list_with_children child_rule
      end
      output += "</ol>"
    end
    output += "</li>"
  end

  def class_by_atom(type)
    case type
    when /events/i
      "blue"
    when /matchers/i
      "orange"
    when /markers/i
      "blue-sky"
    when /page/i
      "green"
    when /values/i
      "purple"
    when /shared/i
      "red"
    end
  end
end
