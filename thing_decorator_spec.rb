require 'spec_helper'

describe NewsDecorator do
  before  { Timecop.freeze(Time.zone.parse('2015-05-15 13:07')) }
  after   { Timecop.return }

  let(:thing) { FactoryGirl.create(:thing) }

  let(:decorated) { ThingDecorator.new(thing, view) }

  describe ".a_method" do
    subject { decorated.thing(options) }

    context 'no options' do
      let(:options){ {} }

      it "has the correct response" do
        expected = "some response"

        is_expected.to eq(expected)
      end
    end
  end

end
