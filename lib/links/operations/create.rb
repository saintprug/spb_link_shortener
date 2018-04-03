module Links
  module Operations
    class Create
      attr_reader :repo

      def initialize(repo: LinkRepository.new)
        @repo = repo
      end

      def call(payload)
        payload[:key] = '123'
        repo.create(payload)
      end
    end
  end
end
