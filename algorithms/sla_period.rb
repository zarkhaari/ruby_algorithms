require 'date'

class SlaPeriod
  attr_accessor :d1, :d2

  def initialize(d1, d2)
    @d1 = Date.parse d1
    @d2 = Date.parse d2
  end

  def execute
    working_days = [1, 2, 3, 4, 5]
    res = (@d1..@d2).to_a.select { |k| working_days.include?(k.wday) }
    p res.count
    res.count == 10
  end
end

describe SlaPeriod do
  subject { described_class.new(d1, d2) }

  describe '#initialize' do
    let(:d1) { "2017-06-07" }
    let(:d2) { "2017-06-20" }

    it { expect(subject.execute).to eq(true) }
  end
end
