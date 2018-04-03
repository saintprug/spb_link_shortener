module Admin::Controllers::Links
  class Create
    include Admin::Action

    attr_reader :operation

    params do
      required(:link).schema do
        required(:url).filled(:str?)
      end
    end

    def initialize(operation: Links::Operations::Create.new)
      @operation = operation
    end

    def call(params)
      operation.call(params[:link]) if params.valid?
      redirect_to routes.root_path
    end
  end
end
