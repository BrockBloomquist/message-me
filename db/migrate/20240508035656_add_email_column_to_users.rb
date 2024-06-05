# frozen_string_literal: true

class AddEmailColumnToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :email, :string
  end
end
