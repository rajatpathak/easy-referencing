class CreateFaqs < ActiveRecord::Migration

  def up
    create_table :faqs do |t|

      t.string "name"
      t.string "content"
      t.integer "vote_good"
      t.integer "vote_bad"
      t.timestamps
    end
    add_index("faqs", "name")
    add_index("faqs", "vote_good")
  end

  def down
  	drop_table :faqs
  end

end
