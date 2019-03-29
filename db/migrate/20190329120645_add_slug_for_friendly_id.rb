class AddSlugForFriendlyId < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :uuid, :string, unique: true
    add_column :articles, :slug, :string, unique: true
    add_column :comments, :uuid, :string, unique: true
    add_column :comments, :slug, :string, unique: true
    Article.all.each do |article|
      string uuid = SecureRandom.uuid
      article.uuid = uuid
      article.slug = uuid
      if article.save
        p "#{article.title} successfully saved!"
      end
    end

    Comment.all.each do |comment|
      string uuid = SecureRandom.uuid
      comment.uuid = uuid
      comment.slug = uuid
      if comment.save
        p "#{comment.message} successfully saved!"
      end
    end
  end
end
