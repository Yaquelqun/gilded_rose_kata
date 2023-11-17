module Updaters
  class StandardItemUpdater
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
      item.quality = [item.quality - (expired? ? 2 : 1), 0].max
    end

    private

    def expired?
      item.sell_in.negative?
    end
  end
end
