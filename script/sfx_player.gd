extends Node

func play_sound(sound: AudioStream, parent: Node):
	if sound != null and parent != null:
		var stream = AudioStreamPlayer.new()
		
		stream.stream = sound
		stream.connect("finished", Callable(stream, "queue_free"))
		
		parent.add_child((stream))
		stream.play()
