# -*- encoding : utf-8 -*-
shared_examples '#name_with_price' do
  before do
    subject.stub(:name) { 'Something' }
    subject.stub(:price) { 3000 }
  end

  it { expect(subject.name_with_price).to eq 'Something - 30,0 sztuk złota' }
end