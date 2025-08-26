extends Node
class_name MusicManager

@onready var level_1: AudioStreamPlayer = $IAB_songs/Level1
@onready var level_2: AudioStreamPlayer = $IAB_songs/Level2
@onready var level_3: AudioStreamPlayer = $IAB_songs/Level3
@onready var level_4: AudioStreamPlayer = $IAB_songs/Level4

@onready var rat_squeak: AudioStreamPlayer3D = $HorrorSounds/RatSqueak
@onready var metal_hinge: AudioStreamPlayer3D = $HorrorSounds/MetalHinge
@onready var metal_groan: AudioStreamPlayer3D = $HorrorSounds/MetalGroan
@onready var splat: AudioStreamPlayer3D = $HorrorSounds/Splat
@onready var splash_nearby: AudioStreamPlayer3D = $HorrorSounds/SplashNearby

@onready var horror_array : Array = [
	rat_squeak,
	metal_hinge,
	metal_groan,
	splat,
	splash_nearby
	
]

@onready var monster_sound_1: AudioStreamPlayer3D = $MonsterSounds/MonsterSound1
@onready var monster_sound_2: AudioStreamPlayer3D = $MonsterSounds/MonsterSound2
@onready var monster_sound_3: AudioStreamPlayer3D = $MonsterSounds/MonsterSound3
@onready var monster_sound_4: AudioStreamPlayer3D = $MonsterSounds/MonsterSound4
@onready var monster_sound_5: AudioStreamPlayer3D = $MonsterSounds/MonsterSound5


@onready var monster_sound_array : Array = [
	monster_sound_1,
	monster_sound_2,
	monster_sound_3,
	monster_sound_4,
	monster_sound_5
]

func _ready() -> void:
	GhostManager.ref.danger_level_changed.connect(_on_danger_level_changed)

#TODO play a safety tinkle sound

func _on_danger_level_changed(level : int) -> void:
	var t : Tween = create_tween()
	if level == 0:
		t.tween_property(level_1, "volume_db", -50, 1)
		t.parallel().tween_property(level_2, "volume_db", -50, 1)
		t.parallel().tween_property(level_3, "volume_db", -50, 1)
		t.parallel().tween_property(level_4, "volume_db", -50, 1)
		return
	
	if level >0:
		t.tween_property(level_1, "volume_db", 5, 1)
	if level >1:
		t.parallel().tween_property(level_2, "volume_db", 5, 1)
	if level >2:
		t.parallel().tween_property(level_3, "volume_db", 5, 1)
	if level >3:
		t.parallel().tween_property(level_4, "volume_db", 5, 1)

var horrorfreq : float = 40.
var time : float = 0.

func _physics_process(delta: float) -> void:
	
	time += delta
	if time >= horrorfreq / GhostManager.ref.get_danger_level():
		if GhostManager.ref.get_danger_level() >= 3:
			var i : int = randi_range(0,1)
			if i == 0:
				play_monster_sound()
			else:
				play_horror_sound()
		time = 0
		horrorfreq = randf_range(35,45)



func play_horror_sound() -> void:
	if Player.ref == null: return
	var horrorsound : AudioStreamPlayer3D = horror_array.pick_random()
	horrorsound.global_position = Player.ref.global_position + Vector3(randf_range(-5,5),0,randf_range(5,5))
	horrorsound.play()

func play_monster_sound() -> void:
	if Player.ref == null: return
	var monstersound : AudioStreamPlayer3D = monster_sound_array.pick_random()
	monstersound.global_position = Player.ref.global_position + Vector3(-5,0,0)
	monstersound.play()
	
	pass
