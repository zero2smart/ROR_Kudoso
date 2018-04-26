class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :member_id
      t.integer :created_by
      t.integer :family_activity_id
      t.datetime :start_time
      t.datetime :end_time
      t.integer :device_id
      t.integer :content_id
      t.integer :allowed_time
      t.integer :activity_type_id
      t.integer :cost
      t.integer :reward

      t.timestamps
    end
  end
end