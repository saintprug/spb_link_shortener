RSpec.describe Web::Controllers::Links::Show, type: :action do
  let(:action) { described_class.new }
  let(:params) { Hash[id: 1] }

  it 'redirects to google' do
    response = action.call(params)
    expect(response).to redirect_to('google.com')
  end
end
