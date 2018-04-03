module Admin::Views::Dashboard
  class Index
    include Admin::View

    def form
      form_for :link, routes.links_path do
        text_field :url

        submit 'Create'
      end
    end
  end
end
