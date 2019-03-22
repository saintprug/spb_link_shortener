require "spec_helper"

RSpec.describe Web::Views::ApplicationLayout, type: :view do
  let(:layout)   { Web::Views::ApplicationLayout.new(template, {}) }
  let(:rendered) { layout.render }
  let(:template) { Hanami::View::Template.new('apps/web/templates/application.html.slim') }

  it 'contains application name', :with_mocks do
    expect(rendered).to include('Web')
  end
end
