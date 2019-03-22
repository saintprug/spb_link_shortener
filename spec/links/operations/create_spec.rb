RSpec.describe Links::Operations::Create do
  let(:operation) { described_class.new(repo: link_repo, key_generator: key_generator) }
  let(:key_generator) { -> { '123' } }
  let(:link_repo) { double(:link_repo, create: Link.new, find_by_url: link) }

  subject { operation.call(link: 'google.com') }

  context 'when link exist in db', :with_mocks do
    let(:link) { Link.new(id: 1) }

    it 'update existed link repository with generated key' do
      expect(link_repo).to receive(:update).with(1, link: 'google.com')
      subject
    end
  end

  context 'when link not exist in db', :with_mocks do
    let(:link) { nil }

    it 'calls repository with generated key' do
      expect(link_repo).to receive(:create).with(key: '123', link: 'google.com')
      subject
    end
  end

  context 'with real repository', :without_mocks do
    let(:operation) { described_class.new }

    after { LinkRepository.new.clear }

    it { expect { subject }.to change { LinkRepository.new.all.count }.by(1) }
    it { expect(subject.key.size).to eq 5 }
  end
end
