require_relative 'application_item_updater'

module Updaters
  class BrieUpdater < ApplicationItemUpdater
    def update_quality
      item.quality = [item.quality + (expired? ? 2 : 1), 50].min
    end

    private

    def expired?
      item.sell_in.negative?
    end
  end
end
