require 'spec_helper'

describe SecurionRails::Configuration do
  let(:service_url) { double }
  let(:secret_key) { double }

  subject do
    described_class
  end

  before do
    SecurionRails::Configuration.service_url = service_url
    SecurionRails::Configuration.secret_key = secret_key
  end

  describe '.service_url' do
    it 'get service_url' do
      expect(subject.service_url).to be(service_url)
    end
  end

  describe '.secret_key' do
    it 'gets secret_key' do
      expect(subject.secret_key).to be(secret_key)
    end
  end
end
