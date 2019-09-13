class CreateMapService < ApplicationService
  def initialize(params)
    @params = params
    puts params
  end
  
  def call  
    return failure_message unless map.valid?

    map.save!
    
    succes_message
  end

  private

  def failure_message
    { succes: false, obj: map }
  end

  def succes_message
    { succes: true, obj: map }
  end

  def map
    @_map ||= Map.new(@params)
  end

end
