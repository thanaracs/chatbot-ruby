class CreateResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :responses do |t|
      t.belongs_to :message_verifier
      t.string :content
      t.timestamps
    end
  end
end
