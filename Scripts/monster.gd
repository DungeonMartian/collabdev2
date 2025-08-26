extends Area3D
class_name Monster

const SPEED: float = 10.

const MONSTER_NOISE : FastNoiseLite = preload("res://Scenes/monster/monster_noise.tres")
@onready var animation_player: AnimationPlayer = $monster_character/AnimationPlayer

func _ready() -> void:
	GhostManager.ref.danger_level_changed.connect(_on_danger_level_changed)
	animation_player.play("ArmatureAction")
	body_entered.connect(_on_body_entered)

var ghost_active : bool = false
var time : float 

func _on_danger_level_changed(level : int) -> void:
	if level == 5:
		ghost_active = true
		return
	ghost_active = false

func _physics_process(delta: float) -> void:
	time += delta
	
	global_position.x += MONSTER_NOISE.get_noise_3d(time,0,0) /10
	global_position.y += MONSTER_NOISE.get_noise_3d(0,time,0)/10
	global_position.z += MONSTER_NOISE.get_noise_3d(0,0, time)/10
	
	if Player.ref == null:
		return
	look_at(Player.ref.global_position)
	if !ghost_active:
		return

	
	global_position = global_position.move_toward(Player.ref.global_position, delta*SPEED)


func _on_body_entered(body: Node3D) -> void:
	if body is Player:
		# TODO fix this later if you want
		get_tree().call_deferred("change_scene_to_file","res://Scenes/main_menu.tscn")
