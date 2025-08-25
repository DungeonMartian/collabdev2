class_name BaseCollectable extends Area3D

func _ready() -> void:
	body_entered.connect(_on_body_entered)

##this calls do pickup action. Don't run this in the children
func _on_body_entered(body: Node3D) -> void:
	if !body is Player:
		return 
	do_pickup_action()

##the action that runs when the body is entered by the player
func do_pickup_action() -> void:
	pass
