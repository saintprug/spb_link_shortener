module Web::Controllers::Links
  class Show
    include Web::Action

    attr_reader :repo

    def initialize(repo: LinkRepository.new)
      @repo = repo
    end

    def call(params)
      if link = repo.find_by_key(params[:id])
        redirect_to link.url
      else
        self.body = 'Not found'
      end
    end
  end
end
