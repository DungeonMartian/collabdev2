class_name DebugUI extends CanvasLayer

static var ref: CanvasLayer

@onready var label_key_count: Label = %Key_Count

@onready var progress_danger_percent: ProgressBar = %Progress_DangerPercent

@onready var progress_danger_level: ProgressBar = %Progress_DangerLevel

func _init() -> void:
	ref = self

func _ready() -> void:
	GhostManager.ref.danger_level_changed.connect(_on_danger_level_changed)
	
func _on_danger_level_changed(level: int) -> void:
	progress_danger_level.value = level

func _process(_delta: float) -> void:
	progress_danger_percent.value = GhostManager.ref.get_danger_percentage()
