extends CanvasLayer
@onready var animation_player: AnimationPlayer = $monster_character/AnimationPlayer
@onready var monster_character: Node3D = $monster_character
@onready var audio_menu: Control = $Control/AudioMenu

func _ready() -> void:
	animation_player.play("ArmatureAction")
	GameStates.change_state(GameStates.states.MAIN_MENU)

func _physics_process(delta: float) -> void:
	monster_character.global_position.z += 1*delta


func _on_play_button_pressed() -> void:
	#TODO start the game somehow
	# you can change this if you want
	GameStates.change_state(GameStates.states.GAMEPLAY)
	GhostManager.ref.set_danger_level(0)
	get_tree().call_deferred("change_scene_to_file","res://Scenes/main.tscn")


func _on_options_button_pressed() -> void:
	audio_menu.visible = !audio_menu.visible
