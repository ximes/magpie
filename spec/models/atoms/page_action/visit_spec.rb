require "rails_helper"

RSpec.describe Atoms::PageAction::Visit, type: :model  do
  describe "when executing" do
    let(:job) { create(:valid_job_with_step) }
    let(:atom) { create(:visit_atom) }

    before do
      job.steps.first.rules.create!(atom: atom)
    end

    xit "visits page" do
      job.perform

    end
  end
end
