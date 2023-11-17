Dir["./services/updaters/*.rb"].each { |file| require file }

module UpdaterManager
  def self.find_updater_for(item)
    # return Updaters::BrieUpdater if item.name == "Aged Brie"
    # return Updaters::SulfurasUpdater if item.name.downcase.include?("sulfuras")
    # return Updaters::BackstagePassUpdater if item.name.downcase.include?("backstage passes")
    # return Updaters::ConjuredItemUpdater if item.name.downcase.include?("conjured")

    ::Updaters::StandardItemUpdater
  end
end
