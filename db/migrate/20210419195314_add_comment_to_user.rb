class AddCommentToUser < ActiveRecord::Migration[6.1]
  def change
    add_reference :comments, :user, index: true
  end
end
