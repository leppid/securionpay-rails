require 'spec_helper'

describe SecurionRails::CrossSaleOffers do
  let(:cross_sale_offer_id) { double }
  let(:params) { double }
  let(:communicator) { double }
  let(:path_builder) { double }
  let(:response) { double }
  let(:path) { double }
  let(:path_builder_receive) { :build_cross_sale_offers_path }

  subject do
    described_class
  end

  before do 
    subject.communicator = communicator
    subject.path_builder = path_builder
  end

  describe '.create' do
    let(:http_method) { :post }
    let(:method) { :create }

    let(:path_builder_with) { nil }
    let(:subject_send_with) { params }
    let(:communicator_with) { params }

    it_behaves_like 'call_communicator'
  end

  describe '.retrieve' do
    let(:http_method) { :get }
    let(:method) { :retrieve }

    let(:path_builder_with) { cross_sale_offer_id }
    let(:subject_send_with) { cross_sale_offer_id }
    let(:communicator_with) { nil }

    it_behaves_like 'call_communicator'
  end

  describe '.update' do
    let(:http_method) { :post }
    let(:method) { :update }

    let(:path_builder_with) { cross_sale_offer_id }
    let(:subject_send_with) { [cross_sale_offer_id, params] }
    let(:communicator_with) { params }

    it_behaves_like 'call_communicator'
  end

  describe '.delete' do
    let(:http_method) { :delete }
    let(:method) { :delete }

    let(:path_builder_with) { cross_sale_offer_id }
    let(:subject_send_with) { cross_sale_offer_id }
    let(:communicator_with) { nil }

    it_behaves_like 'call_communicator'
  end

  describe '.list' do
    let(:http_method) { :get }
    let(:method) { :list }

    let(:path_builder_with) { nil }
    let(:subject_send_with) { nil }
    let(:communicator_with) { nil }

    it_behaves_like 'call_communicator'
  end
end
