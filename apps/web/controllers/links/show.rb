module Web::Controllers::Links
  class Show
    include Web::Action

    def call(params)
      redirect_to 'google.com'
    end
  end
end
