class SoundManager
  attr_accessor :sounds, :music

  constructor :resource_manager, :config_manager
  
  # checks to see if sdl_mixer is availalbe and preloads the sounds and music directories. 
  def setup

    puts 'Warning, sound disabled' unless
      (@enabled = (Rubygame::VERSIONS[:sdl_mixer] != nil))
    @enabled = (@enabled and (@config_manager.settings[:sound].nil? or @config_manager.settings[:sound] == true))

    if @enabled
      @music = {}
      files = Dir.glob "#{MUSIC_PATH}**"
      for f in files
        name = File.basename(f)
        begin
          sym = name.gsub(" ","_").split(".")[0..-2].join(".").to_sym
          ext = name.gsub(" ","_").split(".").last
          unless ext == "txt"
            @music[sym] = @resource_manager.load_music(f)
          end
        rescue;end
      end if files

      @sounds = {}
      files = Dir.glob "#{SOUND_PATH}**"
      for f in files
        name = File.basename(f)
        begin
          sym = name.gsub(" ","_").split(".")[0..-2].join(".").to_sym
          ext = name.gsub(" ","_").split(".").last
          unless ext == "txt"
            @sounds[sym] = @resource_manager.load_sound(f)
          end
        rescue;end
      end if files
    end
  end

  def enabled?
    @enabled
  end

  # plays the sound based on the name with the specified volume level.
  # play_sound :foo # play sound at 100% volume
  def play_sound(what, volume=nil)
    if @enabled && @sounds[what]
      @sound_thread = Thread.new do
        @sounds[what].volume = volume if volume
        @sounds[what].play
      end
    end
  end

  # plays the music based on the name with the specified volume level.
  # will loop until SoundManager#stop_music is called.
  # play_music :foo, 0.8  # play music at 80% volumne
  def play_music(what, volume=nil)
    if @enabled && @music[what]
      @music_thread = Thread.new do
        @music[what].volume = volume if volume
        @music[what].play :repeats => -1
      end
    end
  end

  # stops the music file that is passed in.
  # stop_music :foo
  def stop_music(what)
    if @enabled
      @music[what].stop if @music[what]
    end
  end
  
  # stops the sound that is passed in.
  # stop_sound :foo
  def stop_sound(what)
    if @enabled
      @sounds[what].stop if @sounds[what]
    end
  end

end
