require 'net/http'
require 'uri'
require 'cgi'

module Dinabaztag
  
  class Message
    
    attr_accessor :exec_commands, :api_key, :language
    
    def initialize( api_key, config = {} )
      self.api_key = api_key
      self.language = config[:language] || "hu"
      reset
    end
    
    def reset
      self.exec_commands = []
    end
    
    def exec_choreography( choreography )
      chor_api_url = "http://www.nabaztag.com/api/chor?data=#{choreography.data}"
      
      exec_commands << "CH #{chor_api_url}"
    end
    
    def play_sound( url )
      exec_commands << "MU #{URI.encode(url)}"
    end
    
    def say_message( message )
      url = "http://translate.google.com/translate_tts?ie=UTF-8&q=#{message}&tl=#{self.language}"
      
      play_sound(url)
    end
    
    def wait_for_previous_commands
      exec_commands << "MW"
    end
    
    def perform
      begin
        exec_string = CGI.escape( exec_commands.join("\n") )
        
        url = "http://www.nabaztag.com/nabaztags/#{self.api_key}/exec?command=#{exec_string}"

        puts url

        Net::HTTP.get( URI(url) )
        
        reset
      rescue => e
        puts "Exception happened while calling api url: #{e.message}"
      end
      
    end
  end
end