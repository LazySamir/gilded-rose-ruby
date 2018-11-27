require_relative "../gilded_rose"

describe GildedRose do
  let(:items) { [
    Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20),
    Item.new(name="Aged Brie", sell_in=2, quality=0),
    Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7),
    Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80),
    Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80),
    Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20),
    Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=49),
    Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=49),
    # This Conjured item does not work properly yet
    Item.new(name="Conjured Mana Cake", sell_in=3, quality=6), # <-- :O
  ] }
  
  subject(:gilded_rose) { GildedRose.new(items) }

  describe "#update_quality" do
    describe "for normal items" do
      describe "item quality" do
        it "decreases by 1" do
          expect{gilded_rose.update_quality}.to change{items[0].quality}.by(-1)
        end
        it "does not decrease below 0" do
          items[0].quality = 0
          expect{gilded_rose.update_quality}.to_not change{items[0].quality}
        end
        it "decreases x2 past sell_in date" do
          items[0].sell_in = 0
          expect{gilded_rose.update_quality}.to change{items[0].quality}.by(-2)
        end
      end
      describe "item sell_in value" do
        it "decreases by 1" do
          expect{gilded_rose.update_quality}.to change{items[0].sell_in}.by(-1)
        end  
      end
    end
    
    describe "for Aged Brie" do
      describe "item quality" do
        it "increases by 1" do
          expect{gilded_rose.update_quality}.to change{items[1].quality}.by(+1)
        end
        it "does not increase past 50" do
          items[1].quality = 50
          expect{gilded_rose.update_quality}.to_not change{items[1].quality}
        end
      end
      describe "item sell_in value" do
        it "decreases by 1" do
          expect{gilded_rose.update_quality}.to change{items[1].sell_in}.by(-1)
        end  
      end
    end
  end
end
