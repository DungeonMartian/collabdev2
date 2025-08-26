extends CanvasLayer

@onready var progress_danger_percent: ProgressBar = %Progress_DangerPercent

@onready var progress_danger_level: ProgressBar = %Progress_DangerLevel

func _ready() -> void:
	GhostManager.ref.danger_level_changed.connect(_on_danger_level_changed)
	
func _on_danger_level_changed(level: int) -> void:
	progress_danger_level.value = level

func _process(delta: float) -> void:
	progress_danger_percent.value = GhostManager.ref.get_danger_percentage()
	
	
