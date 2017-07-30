require "rails_helper"

RSpec.describe "jobs/new", type: :view do
  before(:each) do
    assign(:job, Job.new())
  end

  xit "renders new job form" do
    render

    assert_select "form[action=?][method=?]", jobs_path, "post" do
    end
  end
end
