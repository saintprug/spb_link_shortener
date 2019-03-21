RSpec.describe Admin::Views::Dashboard::Index, type: :view do
  let(:exposures) { Hash[format: :html] }
  let(:template)  { Hanami::View::Template.new('apps/admin/templates/dashboard/index.html.slim') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #format', :with_mocks do
    expect(view.format).to eq exposures.fetch(:format)
  end
end
