module SerpChecker
  class Timer
    def initialize count = 60
      @count = count
      run
    end

    def run
      @count.times do |i|
        print "#{@count - i}...\r"
        sleep(1)
      end
      true
    end

    def finish?
      true
    end
  end
end
