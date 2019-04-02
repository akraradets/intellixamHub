# frozen_string_literal: true

class DeviseCreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      ## Database authenticatable
      t.string :username,           null: false, limit: 50
      t.string :encrypted_password, null: false, limit: 100
      t.string :employee_id,        null: false, limit: 30
      t.string :email,              null: false, limit: 100
      t.string :firstname,          null: false, limit: 50
      t.string :lastname,           null: false, limit: 50
      t.string :phone_no,           null: false, limit: 20
      t.string :created_by,                      limit: 50
      t.string :updated_by,                      limit: 50

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end
    add_index :admins, :username,             unique: true
    add_index :admins, :employee_id,          unique: true
    add_index :admins, :email,                unique: true
    add_index :admins, :reset_password_token, unique: true
    # add_index :admins, :confirmation_token,   unique: true
    # add_index :admins, :unlock_token,         unique: true
  end
end
