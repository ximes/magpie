class RulesController < ApplicationController
  include ::TheSortableTreeController::Rebuild

  before_action :set_rule, only: [:show, :edit, :update, :destroy, :move]

  # GET /rules/new
  def new
    @rule = Rule.new
  end

  def edit
  end
  # POST /rules
  # POST /rules.json
  def create
    @rule = Rule.new(rule_params)

    respond_to do |format|
      if @rule.save
        format.json { render :show, status: :created, location: @rule }
      else
        format.json { render json: @rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rules/1
  # PATCH/PUT /rules/1.json
  def update
    respond_to do |format|
      if @rule.update(rule_params)
        format.json { render :show, status: :ok, location: @rule }
      else
        format.json { render json: @rule.errors, status: :unprocessable_entity }
      end
    end
  end

  def move
    parent = Rule.find_by(id: rule_parent_params[:parent_id])
    if parent
      position_saved = @rule.move_to_child_with_index(parent, rule_parent_params[:order].to_i)
    else
      @rule.update_attribute(:order, rule_parent_params[:order].to_i)
      position_saved = @rule.move_to_root
    end

    respond_to do |format|
      if position_saved
        format.json { render :show, status: :ok, location: @rule }
      else
        format.json { render json: @rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rules/1
  # DELETE /rules/1.json
  def destroy
    @rule.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rule
      @rule = Rule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rule_params
      params.fetch(:rule, {}).permit(:step_id, :atom_id, :parent_id, :order)
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def rule_parent_params
      params.fetch(:rule, {}).permit(:parent_id, :order)
    end
end
