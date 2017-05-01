require 'rails_helper'

describe SampleController do

  before(:each) do
    test_csv = Rails.root.join('spec', 'fixtures', 'test.csv')
    allow_any_instance_of(SampleController)
      .to receive(:csv_path)
      .and_return(test_csv)
  end

  %w(ruby rust).each do |klass|
    describe "Get #{klass}" do
      before(:each) do
        get klass.to_sym
      end

      it "is successful" do
        expect(response).to have_http_status(:success)
      end

      it "returns json" do
        expect(response.header['Content-Type']).to include('application/json')
      end

      it "returns valid json" do
        expect(response).to match_response_schema(klass)
      end

      it "matches snapshot" do
        expect(response.body.to_s).to match_snapshot("sample/#{klass}")
      end
    end
  end
end
