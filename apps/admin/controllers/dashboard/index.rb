module Admin::Controllers::Dashboard
  class Index
    include Admin::Action

    expose :links

    attr_reader :operation

    def initialize(operation: Links::Operations::List.new)
      @operation = operation
    end

    def call(params)
      @links = operation.call
    end
  end
end
