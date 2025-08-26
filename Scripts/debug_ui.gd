class_name DebugUI extends CanvasLayer

static var ref: CanvasLayer

@onready var label_key_count: Label = %Key_Count

@onready var debug_torch: MarginContainer = %Debug_Torch

@onready var progress_danger_percent: ProgressBar = %Progress_DangerPercent
@onready var progress_torch_fuel: ProgressBar = %Progress_TorchFuel
@onready var progress_danger_level: ProgressBar = %Progress_DangerLevel

func _init() -> void:
	ref = self

func _ready() -> void:
	if OS.is_debug_build():
		setup_lyzs_audio()
		GhostManager.ref.danger_level_changed.connect(_on_danger_level_changed)
	else:
		visible = false

func _input(_event: InputEvent) -> void:
	if OS.is_debug_build():
		if Input.is_action_just_pressed("Debug_Restart"):
			get_tree().reload_current_scene()
	
func _on_danger_level_changed(level: int) -> void:
	progress_danger_level.value = level

func _process(_delta: float) -> void:
	progress_danger_percent.value = GhostManager.ref.get_danger_percentage()

func setup_lyzs_audio() -> void:
	for device in AudioServer.get_output_device_list():
		if device == "CABLE Input (VB-Audio Virtual Cable)":
			AudioServer.set_output_device(device)
