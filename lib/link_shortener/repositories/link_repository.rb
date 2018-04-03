class LinkRepository < Hanami::Repository
  def find_by_key(key)
    root.where(key: key).one
  end

  def find_by_url(url)
    root.where(url: url).one
  end
end
