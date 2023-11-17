module Updaters
  class BackstagePassUpdater
    attr_reader :item

    def initialize(item)
      @item = item
    end

    def tick
      update_sell_in
      update_quality
    end

    def update_sell_in
      item.sell_in -= 1
    end

    def update_quality
      item_quality = item.quality + quality_increase
      item.quality = [item_quality, 50].min
    end

    private

    def quality_increase
      case item.sell_in
      in (..-1)
        - item.quality
      in (0..4)
        3
      in (5..9)
        2
      else
        1
      end
    end
  end
end
