require 'rails_helper'

describe SampleController, type: :routing do
  describe "sample" do
    it 'has a route for sample/ruby' do
      expect(get: "/sample/ruby").to route_to("sample#ruby")
    end

    it 'has a route for sample/rust' do
      expect(get: "/sample/rust").to route_to("sample#rust")
    end
  end
end
