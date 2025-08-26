extends Camera3D

@onready var timer: Timer = $Timer



var _should_shake : bool = false
var _shake_duration : float = 0.
var _shake_intensity : float = 0.

@onready var chromatic_abberation: ColorRect = $chromatic_abberation
@onready var gaus: ColorRect = $gaus

@onready var vignette: ColorRect = $vignette


@onready var evil_lens_array : Array = [
	chromatic_abberation,
	gaus,
	vignette
]

func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)
	#start_evil_lens()

func shake_screen(intensity : float, duration : float) -> void:
	_should_shake = true
	_shake_intensity = intensity
	_shake_duration = duration
	timer.start(_shake_duration)

func _physics_process(delta: float) -> void:
	if !_should_shake:
		return
	global_position.x += randf_range(-_shake_intensity, _shake_intensity) * delta
	global_position.y += randf_range(-_shake_intensity, _shake_intensity) * delta

# test function for determining that shake screen worked
#func _input(event: InputEvent) -> void:
	#if Input.is_action_just_pressed("Action"):
		#shake_screen(10,1)

func start_evil_lens() -> void:
	var lens : BaseLens = (evil_lens_array.pick_random() as BaseLens)
	lens.start_lens()
	lens.show()


func _on_timer_timeout() -> void:
	_should_shake = false
	var t : Tween = create_tween()
	t.tween_property(self, "position", Vector3.ZERO, .5)
