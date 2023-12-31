#######################################################################
# example_win32_sound.rb (win32-sound)
#
# A example script to demonstrate the win32-sound library and for
# general futzing. You can run this via the 'rake example' task.
#
# Modify as you see fit.
#######################################################################
require 'win32/sound'
include Win32

wav = "c:\\windows\\media\\chimes.wav"

puts "VERSION: " + Sound::VERSION
#puts "Devices: " + Sound.devices.join(", ")

#Sound.volume = [77,128] # my personal settings

orig_left, orig_right = Sound.wave_volume
puts "Volume was: #{orig_left}, #{orig_right}"

#Sound.volume = 140
#puts "Volume is now: " + Sound.volume.join(", ")

#Sound.volume = [orig_left,orig_right]
#puts "Volume is now: " + Sound.volume.join(", ")

puts "Playing 'SystemAsterisk' sound"
sleep 1
Sound.play("SystemAsterisk",Sound::ALIAS)

puts "Playing 'chimes' sound once"
sleep 1
Sound.play(wav)

puts "Playing 'chimes' sound in a loop for 3 seconds"
sleep 1
Sound.play(wav,Sound::ASYNC|Sound::LOOP)
sleep 3
Sound.stop

puts "Playing default sound"
sleep 1
Sound.play("Foofoo", Sound::ALIAS)

puts "Playing a beep"
sleep 1
Sound.beep(500, 2000)

puts "Playing multiple frequencies simultaneously"
sleep 1
threads = []
[440, 660].each do |freq|
  threads << Thread.new { Sound.play_freq(freq) }
end
threads.each { |th| th.join }
