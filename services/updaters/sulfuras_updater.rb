require_relative 'application_item_updater'

module Updaters
  class SulfurasUpdater < ApplicationItemUpdater
    attr_reader :item

    def tick; end
  end
end
