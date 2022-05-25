class_name Blinker
extends Node

export var interval := 0.1 setget _set_interval
export var duration := 5.0 setget _set_duration

onready var interval_timer := $IntervalTimer as Timer
onready var duration_timer := $DurationTimer as Timer

var node_to_blink: Node2D


func _ready() -> void:
	interval_timer.wait_time = interval
	duration_timer.wait_time = duration
	node_to_blink = get_parent() as Node2D


func start():
	interval_timer.start()
	duration_timer.start()


func abort():
	duration_timer.stop()
	interval_timer.stop()
	node_to_blink.visible = true


func _set_interval(value: float):
	interval = value
	interval_timer.wait_time = value


func _set_duration(value: float):
	duration = value
	duration_timer.wait_time = value


func _on_IntervalTimer_timeout() -> void:
	node_to_blink.visible = not node_to_blink.visible


func _on_DurationTimer_timeout() -> void:
	interval_timer.stop()
	node_to_blink.visible = true
