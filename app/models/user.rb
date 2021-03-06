# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_one :profile
  has_many :relationships
  has_many :likes

  def friend(params)
    Relationship.new(user_id: self.id, friendee_id: params[:friendee_id])
  end
end
