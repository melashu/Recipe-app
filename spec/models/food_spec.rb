require 'rails_helper'

RSpec.describe Food, type: :model do
  subject do
    Food.create(name: 'Pizza', measurement_unit: 'gram', price: 10, quantity: 1000, user_id: 1)
  end
  before(:each) { subject.save }

  it 'should have a name' do
    expect(subject.name).to eq('Pizza')
  end

  it 'should have a measurement unit' do
    expect(subject.measurement_unit).to eq('gram')
  end

  it 'should have a price' do
    expect(subject.price).to eq(10)
  end
  it 'should have a quantity' do
    expect(subject.quantity).to eq(1000)
  end
end
