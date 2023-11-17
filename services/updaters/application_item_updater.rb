module Updaters
  class ApplicationItemUpdater
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
      raise 'undefined update_quality method'
    end
  end
end
