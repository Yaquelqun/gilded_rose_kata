require_relative 'application_item_updater'

module Updaters
  class ConjuredItemUpdater < ApplicationItemUpdater
    def update_quality
      item.quality = [item.quality - (expired? ? 4 : 2), 0].max
    end

    private

    def expired?
      item.sell_in.negative?
    end
  end
end
