class GildedRose
  attr_reader :name, :days_remaining, :quality

  # Example Solution: http://www.youtube,com/watch?v=8bZh5LMaSmE

  MAX_QUALITY = 50
  MIN_QUALITY = 0

  def initialize(name:, days_remaining:, quality:)
    @name = name
    @days_remaining = days_remaining
    @quality = quality
  end

  def tick
    case @name
    when 'Aged Brie'
      @days_remaining -= 1
      if @days_remaining < 0
        increment_quality(2)
      else
        increment_quality
      end
    when 'Backstage passes to a TAFKAL80ETC concert'
      @days_remaining -= 1
      if @days_remaining < 0
        @quality = 0
      elsif @days_remaining < 5
        increment_quality(3)
      elsif @days_remaining < 10
        increment_quality(2)
      else
        increment_quality
      end
    when 'Sulfuras, Hand of Ragnaros'
      # Do nothing
    when 'Conjured Mana Cake'
      @days_remaining -= 1
      if @days_remaining <= 0
        decrement_quality(4)
      else
        decrement_quality(2)
      end
    else
      @days_remaining -= 1
      if @days_remaining < 0
        decrement_quality(2)
      else
        decrement_quality
      end
    end
  end

  def increment_quality(amount = 1)
    amount.times do
      @quality += 1 if @quality < MAX_QUALITY
    end
  end

  def decrement_quality(amount = 1)
    amount.times do
      @quality -= 1 if @quality > MIN_QUALITY
    end
  end
end
