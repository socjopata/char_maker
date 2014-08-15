shared_examples '#character_can_use?' do
  let(:character) { double }
  let(:statistics_hash) { { 'strength' => 2 } }

  before do
    subject.stub_chain(:armament_requirements, :all?).and_return(true)
  end

  it { expect(subject.character_can_use?(character, statistics_hash)).to be_true}
end