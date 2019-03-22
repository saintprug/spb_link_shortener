RSpec.describe Admin::Controllers::Links::Create, type: :action do
  let(:action) { described_class.new(operation: operation) }
  let(:operation) { -> (_) { } }

  context 'when params valid', :with_mocks do
    let(:params) { { link: { url: 'google.com' } } }

    it 'calls operation' do
      expect(operation).to receive(:call).once
      action.call(params)
    end

    it { expect(action.call(params)).to redirect_to '/admin' }
  end

  context 'when params invalid', :with_mocks do
    let(:params) { {} }

    it 'does not call operation' do
      expect(operation).not_to receive(:call)
      action.call(params)
    end

    it { expect(action.call(params)).to redirect_to '/admin' }
  end
end
