dinabaztag
==========

Dinabaztag is a Ruby wrapper for the Nabaztag rabbit's new API documented [here](nabaztag.com).

With Dinabaztag, you can control your Nabaztag's ears and lights through it's choreography API, and surely you can play sound files on it. It also supports Text To Speech functionality through Google's unofficial TTS API on any languages which Google supports.

Installation
------------

Dinabaztag is distributed as a gem, which is how it should be used in your app.

Include the gem in your Gemfile:

```ruby
gem "dinabaztag", ">=0.0.2"
```
To get an API key, you have to register your rabbit on nabaztag.com.

Usage
-----

### Initializing Message

You can communicate with the API through the  Dinabaztag::Message class. You can play a soundfile, send a TTS message, or add some advanced choreography.

### Playing sound files

```ruby
m = Dinabaztag::Message.new( '__YOUR_API_KEY_HERE__' )
m.play_sound("http://www.digitalnatives.hu/success.mp3")
m.perform
```

### Text To Speech

Set your Nabaztag's TTS language when initializing the Message class.

```ruby
m = Dinabaztag::Message.new( '__YOUR_API_KEY_HERE__', :language => :en )
m.say_message("Hey, I'm Nabaztag, the rabbit!")
m.perform
```
### Choreography

#### Ear movement

```ruby
ear_movement_action_0 = Dinabaztag::Action::EarMovement.new( :angle => 0 )
ear_movement_action_180 = Dinabaztag::Action::EarMovement.new( :angle => 180 )

chor = Dinabaztag::Choreography.new
chor.add_action(0, ear_movement_action_0 )
chor.add_action(1, ear_movement_action_180 )

m = Dinabaztag::Message.new( '__YOUR_API_KEY_HERE__' )
m.exec_choreography( chor )
m.perform
```

#### Led lights

Coming soon...

### Advanced usage

You can connect the examples above into one command with the wait_for_previous_commands method.

```ruby
ear_movement_action_0 = Dinabaztag::Action::EarMovement.new( :angle => 0 )
ear_movement_action_180 = Dinabaztag::Action::EarMovement.new( :angle => 180 )

chor = Dinabaztag::Choreography.new
chor.add_action(0, ear_movement_action_0 )
chor.add_action(1, ear_movement_action_180 )

m = Dinabaztag::Message.new( '__YOUR_API_KEY_HERE__', :language => :en )
m.play_sound("http://www.digitalnatives.hu/success.mp3")
m.wait_for_previous_commands
m.say_message("Hey, I'm Nabaztag, the rabbit!")
m.wait_for_previous_commands
m.exec_choreography( chor )
m.perform
```

Credits
-------

<img src="http://m.blog.hu/di/digitalnatives/skins/white_swirl_dina/img/logo.png" width="150"/>

Dinabaztag is maintained by [Digital Natives](http://digitalnatives.hu)

License
-------

Dinabaztag is Copyright © 2008-2012 Digital Natives. It is free software, and may be
redistributed under the terms specified in the MIT-LICENSE file.
