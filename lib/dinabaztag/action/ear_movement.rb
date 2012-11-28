module Dinabaztag
  module Action
    class EarMovement

      attr_accessor :ear, :angle, :direction

      def initialize( attrs = {} )
        default_attributes = {
          :ear        => 'both',
          :direction  => 'forward',
          :angle      => 0
        }
        attrs = default_attributes.merge( attrs )

        self.ear          = attrs[:ear]
        self.angle        = attrs[:angle]
        self.direction    = attrs[:direction]
      end

      def chor_type
        'motor'
      end

      def chor_datas( message_ear = self.ear )
        if message_ear.to_s == 'both'
          return [ chor_datas('left').first, chor_datas('right').first ]
        else
          return  [ [ 
                    self.chor_type,
                    message_ear.to_s == 'right' ? 0 : 1,
                    self.angle,
                    0,
                    self.direction.to_s == 'forward' ? 0 : 1 
                    ].map{ |p| p.to_s }.join( "," ) ]
        end
      end
    end
  end
end