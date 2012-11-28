module Dinabaztag  
  class Choreography
    
    attr_accessor :actions, :tempo
    
    def initialize( tempo = 10)
      self.actions = Hash.new { |hash, key| hash[key] = [] }
      self.tempo = tempo
    end
    
    def add_action( action_time, action )
      self.actions[action_time] << action
    end
    
    def data
      action_data = self.actions.map do |action_time,actions_at_time|
        actions_at_time.map do |action| 
          action.chor_datas.map{ |chor_data| "#{action_time},#{chor_data}" }
        end.join(",")
      end.join(",")
      
      "#{tempo},#{action_data}"
    end
  end

end