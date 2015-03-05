class AddEmailsTable < ActiveRecord::Migration
  def change
    create_table :recoil_bounces do |t|
      t.string :email
      t.string :bounce_type

      t.timestamps
    end
  end
end
