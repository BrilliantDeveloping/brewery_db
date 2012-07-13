# encoding: UTF-8

require 'spec_helper'

describe BreweryDB::Resource, :resource do
  context '#get', vcr: cassette_options do
    let(:resource) do
      Class.new {
        include BreweryDB::Resource

        def ok
          get('breweries', name: 'Rogue Ales')
        end

        def bad_request
          get('breweries')
        end

        def not_found
          get('brewery/NOT_FOUND')
        end
      }.new(client)
    end

    context 'an OK request' do
      subject { resource.ok.first }

      its(:name) { should == 'Rogue Ales' }
    end

    context 'a bad request' do
      subject { resource.bad_request }

      its(:errorMessage) { should match /data.*invalid/ }
      its(:status) { should eq 'failure' }
    end

    context 'a not found request' do
      subject { resource.not_found }

      its(:errorMessage) { should match /not\s+found/ }
      its(:status) { should eq 'failure' }
    end
  end
end