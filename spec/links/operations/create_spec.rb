RSpec.describe Links::Operations::Create do
  let(:operation) { described_class.new(repo: link_repo) }
  let(:link_repo) { double(:link_repo, create: Link.new, find_by_url: link) }

  subject { operation.call(link: 'google.com') }

  context 'when link exist in db' do
    let(:link) { Link.new(id: 1) }

    it 'update existed link repository with generated key' do
      expect(link_repo).to receive(:update).with(1, link: 'google.com')
      subject
    end
  end

  context 'when link not exist in db' do
    let(:link) { nil }

    it 'calls repository with generated key' do
      expect(link_repo).to receive(:create).with(key: '123', link: 'google.com')
      subject
    end
  end

  context 'with real repository' do
    let(:operation) { described_class.new }

    after { LinkRepository.new.clear }

    it { expect { subject }.to change { LinkRepository.new.all.count }.by(1) }
  end
end
