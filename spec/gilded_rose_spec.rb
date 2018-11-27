require_relative "../gilded_rose"

describe GildedRose do
  let(:items) { [
    Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20)
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
  end
end
