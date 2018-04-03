module Admin::Controllers::Links
  class Create
    include Admin::Action

    def call(params)
      self.body = 'OK'
    end
  end
end
