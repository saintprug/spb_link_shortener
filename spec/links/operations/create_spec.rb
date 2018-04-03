RSpec.describe Links::Operations::Create do
  let(:operation) { described_class.new(repo: link_repo) }
  let(:link_repo) { double(:link_repo, create: Link.new) }

  subject { operation.call(link: 'google.com') }

  it 'calls repository with generated key' do
    expect(link_repo).to receive(:create).with(key: '123', link: 'google.com')
    subject
  end

  context 'with real repository' do
    let(:operation) { described_class.new }

    after { LinkRepository.new.clear }

    it { expect { subject }.to change { LinkRepository.new.all.count }.by(1) }
  end
end
