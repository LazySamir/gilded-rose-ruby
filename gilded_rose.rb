class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      case item.name
        when "Aged Brie"
          update_brie(item)
        when "Sulfuras, Hand of Ragnaros"
        when "Backstage passes to a TAFKAL80ETC concert"
          update_backstage(item)
        when "Conjured Mana Cake"
          update_conjured(item)
        else
          update_normal(item)
      end
    end
  end

private

  def update_brie(item)
    item.quality += 1 if item.quality < 50
    item.sell_in -= 1
  end
  
  def update_backstage(item)
    if item.quality < 50
      item.quality += 1 if item.sell_in > 10
      item.quality += 2 if item.sell_in.between?(6, 10)
      item.quality += 3 if item.sell_in.between?(1, 5)
      item.quality = 0 if item.sell_in <= 0
    else
      return
    end
    item.sell_in -= 1
  end
  
  def update_conjured(item)
    (item.sell_in > 0 ? item.quality -= 2 : item.quality -= 4) if item.quality > 0 
    item.sell_in -= 1
  end
  
  def update_normal(item)
    (item.sell_in > 0 ? item.quality -= 1 : item.quality -= 2) if item.quality > 0 
    item.sell_in -= 1
  end
  
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end