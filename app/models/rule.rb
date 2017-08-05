class Rule < Atom
  has_many :jobs_rules, class_name: "Jobs::Rule", foreign_key: "atom_id"
end
