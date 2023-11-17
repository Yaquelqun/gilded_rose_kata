class UpdateItem
  attr_reader :item, :updater

  def initialize(item, updater)
    @item = item
    @updater = updater
  end

  def tick
    if item.name != 'Aged Brie' && item.name != 'Backstage passes to a TAFKAL80ETC concert'
      if item.quality > 0
        if item.name != 'Sulfuras, Hand of Ragnaros'
          item.quality -= 1
        end
      end
    else # item name is aged brie or backstage pass
      if item.quality < 50
        item.quality += 1
        if item.name == 'Backstage passes to a TAFKAL80ETC concert'
          if item.sell_in < 11
            if item.quality < 50
              item.quality += 1
            end
          end
          if item.sell_in < 6
            if item.quality < 50
              item.quality += 1
            end
          end
        end
      end
    end

    # Update sell_in
    item.sell_in -= 1 if item.name != 'Sulfuras, Hand of Ragnaros'

    # This basically re-updates the quality if the item is expired (useful for normal items/backstage passes and aged brie)
    if item.sell_in < 0
      if item.name != "Aged Brie"
        if item.name != 'Backstage passes to a TAFKAL80ETC concert'
          if item.quality > 0 && item.name != 'Sulfuras, Hand of Ragnaros'
            item.quality -= 1
          end
        else
          item.quality = 0
        end
      elsif item.quality < 50 # if it's brie then
        item.quality += 1
      end
    end
  end
end
