# frozen_string_literal: true

class AddUserBio < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :bio, :text
  end
end
