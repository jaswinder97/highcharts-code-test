class CreateStats < ActiveRecord::Migration[5.1]
  def change
    create_table :stats do |t|
      t.string :client_id, null: false
      t.datetime :period_starting
      t.string :operation_type
      t.string :operation
      t.string :start_result
      t.string :finish_result
      t.string :operations_started
      t.string :operations_finished
      t.integer :distinct_identities
      t.text :total_elapsed_time      #for storing hash values
      t.text :average_elapsed_time    #for storing hash values
      t.string :option_type           #for storing option value like hour/day/week etc
      t.references :app               #for storing app associated id

      t.timestamps
    end
  end
end
