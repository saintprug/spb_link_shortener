module Links
  module Libs
    class KeyGenerator
      def call
        SecureRandom.hex[0..4]
      end
    end
  end
end
