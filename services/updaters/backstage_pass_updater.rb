require_relative 'application_item_updater'

module Updaters
  class BackstagePassUpdater < ApplicationItemUpdater
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
