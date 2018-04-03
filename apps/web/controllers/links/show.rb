module Web::Controllers::Links
  class Show
    include Web::Action

    attr_reader :operation

    def initialize(operation: Links::Operations::Show.new)
      @operation = operation
    end

    def call(params)
      if link = operation.call(key: params[:id])
        redirect_to link.url
      else
        self.body = 'Not found'
      end
    end
  end
end
