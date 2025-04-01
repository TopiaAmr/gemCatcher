extends Node2D

const EXPLODE = preload("res://assets/explode.wav")
const GEM = preload("res://gems/gem.tscn")

const MARGIN: float = 70

@onready var spawn_timer: Timer = $SpawnTimer
@onready var score_sound: AudioStreamPlayer2D = $ScoreSound
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func stop_all() -> void:
	audio_stream_player.stop()
	audio_stream_player.stream = EXPLODE
	audio_stream_player.play()
	spawn_timer.stop()
	for child in get_children():
		if child is Gem:
			child.set_process(false)
		if child is Paddle:
			child.set_process(false)
	

func _ready() -> void:
	spawn_gem()

func spawn_gem() -> void:
	var new_gem: Gem = GEM.instantiate()
	var x_pos: float = randf_range(
		get_viewport_rect().position.x + MARGIN, 
		get_viewport_rect().end.x - MARGIN
	)
	new_gem.position = Vector2(x_pos, -MARGIN)
	new_gem.gem_off_screen.connect(_on_gem_off_screen)
	add_child(new_gem)

func _on_paddle_area_entered(area: Area2D) -> void:
	print("collision ", area)
	if score_sound.playing == false:
		score_sound.position = area.position
		score_sound.play()


func _on_gem_off_screen() -> void:
	stop_all()


func _on_timer_timeout() -> void:
	spawn_gem()
