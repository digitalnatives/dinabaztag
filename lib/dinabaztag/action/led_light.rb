module Dinabaztag
  module Action
    class LedLight

      attr_accessor :led, :color

      COLORS = {
        :black  => [ 0, 0, 0 ],
        :red    => [ 255, 0, 0 ],
        :green  => [ 0, 255, 0 ],
        :blue   => [ 0, 0, 255 ],
        :yellow => [ 255, 255, 0 ]
      }

      def initialize( attrs = {} )
        default_attributes = {
          :color      => 'green',
          :led        => 'middle'
        }
        attrs = default_attributes.merge( attrs )
        attrs[:color] = COLORS[attrs[:color].to_sym] unless attrs[:color].is_a?(Array)
        raise "undefined color" unless attrs[:color].is_a?(Array) && attrs[:color].size == 3

        self.color        = attrs[:color]
        self.led          = attrs[:led]
      end

      def led_value
        if led.is_a?( Fixnum )
          return led
        else
          case self.led.to_s
          when 'bottom'
            0
          when 'left'
            1
          when 'middle'
            2
          when 'right'
            3
          when 'top'
            4
          end
        end
      end

      def chor_type
        'led'
      end

      def chor_datas
        [ ( [ self.chor_type, self.led_value ] + self.color ).flatten.join(",") ]
      end

    end
  end
end