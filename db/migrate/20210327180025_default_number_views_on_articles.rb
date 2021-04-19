class DefaultNumberViewsOnArticles < ActiveRecord::Migration[6.1]
  def change
    change_column :articles, :views, :integer, :default => 0
    Article.update_all(views: 0)
  end
end
