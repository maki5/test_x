# frozen_string_literal: true

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  default_scope -> { order("_created_at ASC") }

  field :first_name, type: String
  field :last_name, type: String
end