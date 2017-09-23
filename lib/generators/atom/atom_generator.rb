class AtomGenerator < Rails::Generators::NamedBase
  desc "This generator creates an atom model file"
  source_root File.expand_path("../templates", __FILE__)

  #name: family name
  argument :family_name, type: :string, required: true

  def create_model
    template "model.erb", "app/models/atoms/#{family_name.classify.underscore.downcase}/#{name.classify.underscore.downcase}.rb"
  end

  def create_views
    copy_file "show.erb", "app/views/atoms/#{family_name.classify.underscore.downcase}/#{name.classify.underscore.downcase}/show.erb"
  end

  def create_spec
    template "model_rspec.erb", "spec/models/atoms/#{family_name.classify.underscore.downcase}/#{name.classify.underscore.downcase}_spec.rb"
  end

  def create_seed
    append_to_file "db/seeds.rb", "Atom.create(name: \"#{name.classify}\", class_name: \"Atoms::#{family_name.classify}::#{name.classify}\", enabled: true)" if gsub_file("db/seeds.rb", /Atoms::#{family_name.classify}::#{name.classify}/i)
  end
end
