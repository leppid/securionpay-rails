require 'spec_helper'

describe SecurionRails::Cards do
  before do
    SecurionRails::Configuration.secret_key = ENV['SECRET_KEY']
  end

  it 'create and retrieve credit card' do
    customer = SecurionRails::Customers.create({
      email: random_email
    })
    cardholder_name = random_string

    card = SecurionRails::Cards.create(customer['id'], {
      number: '4242424242424242',
      expMonth: '12',
      expYear: '2020',
      cvc: '123',
      cardholderName: cardholder_name
    })

    card = SecurionRails::Cards.retrieve(card['customerId'], card['id'])
    expect(card['last4']).to eq('4242')
    expect(card['expMonth']).to eq('12')
    expect(card['expYear']).to eq('2020')
    expect(card['cardholderName']).to eq(cardholder_name)
  end
end
