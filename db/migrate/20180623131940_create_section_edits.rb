class CreateSectionEdits < ActiveRecord::Migration
  def up
    create_table :section_edits do |t|
      t.integer "admin_user_id"
      t.integer "section_id"
      t.string "summary"          
      t.timestamps null: false
    end
    add_index :section_edits, ["admin_user_id", "section_id"]
  end
  def down
    drop_table :section_edits
  end
end
  