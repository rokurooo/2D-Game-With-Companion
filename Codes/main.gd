extends Node2D

@onready var GameUi := get_node('Ui')
@onready var MainMenu := get_node('Menu')

@onready var player := get_node('Player')
var paused := false
func _ready():
	MainMenu.hide()
	GameUi.show()
	


func _process(_delta):
	if Input.is_action_just_pressed("menu"):
		_menu_open()


func _menu_open():
	match paused:
		true:
			GameUi.show()
			MainMenu.hide()
			player.game_paused = false
			paused = false
			return
		false:
			GameUi.hide()
			MainMenu.show()
			player.game_paused = true
			paused = true
			return
