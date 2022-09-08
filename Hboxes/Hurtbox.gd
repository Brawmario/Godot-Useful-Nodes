class_name Hurtbox
extends Area2D

signal hit(damage)


func _ready() -> void:
	connect("area_entered", self, "_on_area_entered")


func _on_area_entered(hitbox: Hitbox) -> void:
	if not hitbox:
		return
	emit_signal("hit", hitbox.damage)
