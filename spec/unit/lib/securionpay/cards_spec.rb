require 'spec_helper'

describe SecurionRails::Cards do
  let(:customer_id) { 'some_customer_id' }
  let(:card_id) { 'some_card_id' }
  let(:params) { double }
  let(:communicator) { double }
  let(:path_builder) { double }
  let(:response) { double }
  let(:path) { double }
  let(:path_builder_receive) { :build_card_path }
  let(:path_builder_with) { [customer_id, card_id] }
  let(:subject_send_with) { [customer_id, card_id] }
  let(:communicator_with) { nil }

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
    let(:path_builder_with) { customer_id }
    let(:communicator_with) { params }
    let(:subject_send_with) { [customer_id, params] }
    it_behaves_like 'call_communicator'
  end

  describe '.retrieve' do
    let(:http_method) { :get }
    let(:method) { :retrieve }
    it_behaves_like 'call_communicator'
  end

  describe '.update' do
    let(:http_method) { :post }
    let(:method) { :update }
    let(:communicator_with) { params }
    let(:subject_send_with) { [customer_id, card_id, params] }
    it_behaves_like 'call_communicator'
  end

  describe '.delete' do
    let(:http_method) { :delete }
    let(:method) { :delete }
    it_behaves_like 'call_communicator'
  end

  describe '.list' do
    let(:http_method) { :get }
    let(:method) { :list }
    let(:path_builder_with) { customer_id }
    let(:subject_send_with) { customer_id }
    it_behaves_like 'call_communicator'
  end
end
