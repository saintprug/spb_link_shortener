module Links
  module Operations
    class Show
      attr_reader :repo, :key_generator

      def initialize(repo: LinkRepository.new)
        @repo = repo
      end

      def call(key:)
        if link = repo.find_by_key(key)
          repo.update(link.id, clicks: link.clicks + 1)
        end

        link
      end
    end
  end
end
