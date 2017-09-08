require "rails_helper"

RSpec.describe RulesController, type: :controller do

  login_user

  # This should return the minimal set of attributes required to create a valid
  # Rule. As you add validations to Rule, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RulesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #edit" do
    it "returns a success response" do
      rule = Rule.create! valid_attributes
      get :edit, params: { id: rule.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Rule" do
        expect {
          post :create, params: { rule: valid_attributes }, session: valid_session
        }.to change(Rule, :count).by(1)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { rule: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested rule" do
        rule = Rule.create! valid_attributes
        put :update, params: { id: rule.to_param, rule: new_attributes }, session: valid_session
        rule.reload
        skip("Add assertions for updated state")
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        rule = Rule.create! valid_attributes
        put :update, params: { id: rule.to_param, rule: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested rule" do
      rule = Rule.create! valid_attributes
      expect {
        delete :destroy, params: { id: rule.to_param }, session: valid_session
      }.to change(Rule, :count).by(-1)
    end
  end

end
