class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name == "Aged Brie"
        update_brie(item)
      elsif item.name == "Sulfuras, Hand of Ragnaros"
      
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        update_backstage(item)

        
      else
        if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
          if item.quality > 0
            if item.name != "Sulfuras, Hand of Ragnaros" && item.name != "Conjured Mana Cake"
              item.quality = item.quality - 1
            end
            if item.name == "Conjured Mana Cake"
              item.quality -= 2
            end
          end
        else
          if item.quality < 50
            item.quality = item.quality + 1
            if item.name == "Backstage passes to a TAFKAL80ETC concert"
              if item.sell_in < 11
                if item.quality < 50
                  item.quality = item.quality + 1
                end
              end
              if item.sell_in < 6
                if item.quality < 50
                  item.quality = item.quality + 1
                end
              end
            end
          end
        end
        if item.name != "Sulfuras, Hand of Ragnaros" 
          item.sell_in = item.sell_in - 1
        end
        if item.sell_in < 0
          if item.name != "Aged Brie"
            if item.name != "Backstage passes to a TAFKAL80ETC concert"
              if item.quality > 0
                if item.name != "Sulfuras, Hand of Ragnaros" && item.name != "Conjured Mana Cake"
                  item.quality = item.quality - 1
                end
                if item.name == "Conjured Mana Cake"
                  item.quality -= 2
                end
              end
            else
              item.quality = item.quality - item.quality
            end
          else
            if item.quality < 50
              item.quality = item.quality + 1
            end
          end
        end
      end
    end
  end
end

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