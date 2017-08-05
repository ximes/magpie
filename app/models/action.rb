class Action < Atom
  has_many :jobs_actions, class_name: "Jobs::Action", foreign_key: "atom_id"
end
