extends Control

func _ready():
	pass
	
func _process(delta):
	pass
	
	
	

func _on_start_game_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/game.tscn")

func _on_settings_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Ui/menu/settings.tscn")

func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Ui/menu/credits.tscn")

func _on_quit_game_button_pressed() -> void:
	get_tree().quit()
