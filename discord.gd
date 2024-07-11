extends Node

var NotInLevel = true
@export var state: String
@export_enum("1", "2", "Boss", " ") var actnumb: String
@export_enum("Sonic Generations", "Shadow Generations", "Title Screen") var gamever: String

func _ready():
	DiscordRPC.app_id = 1154128098141417574 # Application ID
	DiscordRPC.details = gamever
	DiscordRPC.state = ("{state} Act {actnum}".format([["state", state],["actnum", actnumb]]))
	DiscordRPC.large_image = "sxsgicon"
	
	DiscordRPC.start_timestamp = int(Time.get_unix_time_from_system()) # "02:46 elapsed"
# DiscordRPC.end_timestamp = int(Time.get_unix_time_from_system()) + 3600 # +1 hour in unix time / "01:00:00 remaining"

	DiscordRPC.refresh() # Always refresh after changing the values!





func _on_button_pressed():
	if $CheckBox.button_pressed == true:
		NotInLevel = true
	else:
		NotInLevel = false
	
	if NotInLevel == false:
		DiscordRPC.state = ("{state} Act {actnum}".format([["state", $LineEdit.text],["actnum", $LineEdit2.text]]))
		DiscordRPC.start_timestamp = int(Time.get_unix_time_from_system()) # "02:46 elapsed"
		DiscordRPC.refresh() # Always refresh after changing the values!
	else:
		DiscordRPC.state = ("{state}".format([["state", $LineEdit.text],["actnum", $LineEdit2.text]]))
		DiscordRPC.start_timestamp = int(Time.get_unix_time_from_system()) # "02:46 elapsed"
		DiscordRPC.refresh() # Always refresh after changing the values!


func _on_item_list_item_selected(index: int) -> void:
	DiscordRPC.details = ($ItemList.get_item_text(index))
