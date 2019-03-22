RSpec.describe Web::Controllers::Links::Show do
  let(:action) { described_class.new(operation: operation) }
  let(:params) { Hash[id: 1] }
  let(:operation) { ->(_) { entity } }

  context 'when link exist', :with_mocks do 
    let(:entity) { Link.new(url: 'google.com') }

    it { expect(action.call(params)).to redirect_to('google.com') }
  end

  context 'when link does not exist', :with_mocks do
    let(:entity) { nil }

    it 'returns error message' do
      response = action.call(params)
      expect(response[2]).to eq ['Not found']
    end
  end

  context 'when action calls real repository', :without_mocks do
    let(:action) { described_class.new }
    let(:params) { Hash[id: link.key] }
    let(:link) { link_repo.create(key: '123', url: 'google.com') }
    let(:link_repo) { LinkRepository.new }

    after { link_repo.clear }

    it { expect(action.call(params)).to redirect_to('google.com') }
  end
end
