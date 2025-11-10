extends Node

## Paste your product keys here ##
@onready var product_id: String = ""
@onready var sandbox_id: String = ""
@onready var deployment_id: String = ""
@onready var client_id: String = ""
@onready var client_secret: String = ""
#this is a 64 character hexidecimal value use to encrypt your product keys. This is just a sample game so you can skip this if you want.
@onready var encryption_key: String = "" 


func _ready() -> void:
	var config = ConfigFile.new()
	var path = "res://_git_ignore/eos_secret_settings.cfg"
	
	# handle error
	var error = config.load(path)
	if error != OK:
		print(name, " - error loading config file: ", error)
		return
	
	# retrieve values
	product_id = config.get_value("EOS", "product_id")
	sandbox_id = config.get_value("EOS", "sandbox_id")
	deployment_id = config.get_value("EOS", "deployment_id")
	client_id = config.get_value("EOS", "client_id")
	client_secret = config.get_value("EOS", "client_secret")
	encryption_key = config.get_value("EOS", "encryption_key", "")
