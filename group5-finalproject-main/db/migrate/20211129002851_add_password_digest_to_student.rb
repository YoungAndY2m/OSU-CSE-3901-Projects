class AddPasswordDigestToStudent < ActiveRecord::Migration[6.0]
  def change
    change_table :students do |t|
      t.string "password_digest"
    end
  end
end
