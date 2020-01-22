class Api::V1::RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_relationship, only: [:show, :update, :destroy]

  def index
    render json: current_user.relationships
  end

  def show
    render json: @relationship
  end

  def create
    relationship = current_user.friend(relationship_params)
    if relationship.save
      render json: relationship
    else
      render json: relationship.errors
    end
  end

  def update
    if @relationship.update(relationship_params)
      render json: relationship
    else
      render json: relationship.errors
    end
  end

  def destroy
    @relationship.destroy
    render json: { message: "Relationship deleted" }
  end

  private

  def set_relationship
    @relationship = current_user.relationships.find(params[:id])
  end

  def relationship_params
    params.require(:relationship).permit(:friendee_id)
  end
end
