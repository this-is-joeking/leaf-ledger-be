# frozen_string_literal: true

class AddGidToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :gid, :string
  end
end
