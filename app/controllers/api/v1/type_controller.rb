class Api::V1::TypeController < ApplicationController
  before_action :authenticate_user!
  before_action :set_relationship, only: :create
  before_action :set_type, only: [:show, :update, :destroy]
  def show
    render json: @type
  end

  def update
    if @type.update(type_params)
      render json: @type
    else
      render json: @type.errors
    end
  end

  def create
    type = @relationship.create_type(type_params)
    if type.save
      render json: type
    else
      render json type.errors
    end
  end

  def destroy
    @type.destroy
    render json: { message: "Type deleted" }
  end

  private

  def set_relationship
    @relationship = Relationship.find(params[:relationship_id])
  end

  def set_type
    @type = @relationship.type
  end

  def type_params
    params.require(:type).permit(:relationship_type)
  end
end
  
