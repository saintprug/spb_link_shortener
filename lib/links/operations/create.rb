module Links
  module Operations
    class Create
      attr_reader :repo

      def initialize(repo: LinkRepository.new)
        @repo = repo
      end

      def call(payload)
        if link = repo.find_by_url(payload[:link])
          repo.update(link.id, payload)
        else
          payload[:key] = '123'
          repo.create(payload)
        end
      end
    end
  end
end
