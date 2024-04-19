class RemoveCommentFromComments < ActiveRecord::Migration[6.1]
  def change
    remove_column :comments, :comment, :text
  end
end
