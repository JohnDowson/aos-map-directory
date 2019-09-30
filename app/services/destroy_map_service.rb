class DestroyMapService < ApplicationService
  def initialize(map)
    @map = map
  end

  def call
    @map.taggings.each { |t| t.destroy }
    @map.destroy
  end

end
