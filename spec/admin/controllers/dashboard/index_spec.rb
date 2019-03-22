RSpec.describe Admin::Controllers::Dashboard::Index, type: :action do
  let(:action) { described_class.new(operation: operation) }
  let(:operation) { -> { [] } }
  let(:params) { Hash[] }

  it 'is successful', :with_mocks do
    response = action.call(params)
    expect(response[0]).to eq 200
  end

  it 'saves links', :with_mocks do
    action.call(params)
    expect(action.links).to eq []
  end
end
