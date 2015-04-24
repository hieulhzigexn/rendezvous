class PostsDecorator < Draper::CollectionDecorator
  def related_tags
    tags = map(&:tags).flatten.uniq.take(10)

    TagDecorator.decorate_collection(tags)
  end

  def related_authors
    map(&:author).flatten.uniq.map(&:decorate)
  end
end
