extends Node2D


func _on_paddle_area_entered(area: Area2D) -> void:
	print("collision ", area)
