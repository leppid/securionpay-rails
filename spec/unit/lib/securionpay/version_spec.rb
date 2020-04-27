require 'spec_helper'

describe SecurionRails do
  describe 'gem has a version number' do
    it 'checks the number' do
      expect(SecurionRails::VERSION).not_to be_falsey
    end
  end
end
