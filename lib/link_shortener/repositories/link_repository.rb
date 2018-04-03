class LinkRepository < Hanami::Repository
  def find_by_key(key)
    links.where(key: key).one
  end
end
