class CreateJobs < ActiveRecord::Migration[7.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :company
      t.string :link
      t.string :website

      t.timestamps
    end
  end
end
