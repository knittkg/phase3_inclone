class AddUserRefToPostpicts < ActiveRecord::Migration[5.1]
  def change
    add_reference :postpicts, :user, foreign_key: true
  end
end
