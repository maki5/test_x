# frozen_string_literal: true

class User
  include Mongoid::Document
  include Mongoid::Timestamps
  default_scope -> { order("_created_at ASC") }

  field :first_name, type: String
  field :last_name, type: String

  after_update :cable_update

  def cable_update
    ActionCable.server.broadcast 'users_channel', user: render_user(self), user_edit: render_user_edit(self), id: self.id.to_s
  end

  def render_user(user)
    ApplicationController.render(partial: 'users/user', locals: { user: user })
  end

  def render_user_edit(user)
    ApplicationController.render(partial: 'users/user_edit', locals: { user: user })
  end
end