extends Node

const CONFIG_FILE_PATH: String = "user://config.cfg";

@onready var _config := ConfigFile.new()

@onready var _audioSettings := AudioSettings.new(SendAudioSettingsUpdated)
@onready var _graphicsSettings := GraphicsSettings.new(SendGraphicsSettingsUpdated)


signal AudioSettingsUpdated(audioSettings: AudioSettings)
signal GraphicsSettingsUpdated(graphicsSettings: AudioSettings)

func _ready():
	_config.load(CONFIG_FILE_PATH)
	LoadConfiguration(_config)


func LoadConfiguration(config: ConfigFile) -> void:
	_audioSettings.LoadFromConfig(config)
	_graphicsSettings.LoadFromConfig(config)

func SaveConfiguration(config: ConfigFile) -> void:
	_audioSettings.LoadFromConfig(config)
	_graphicsSettings.LoadFromConfig(config)

func SendAudioSettingsUpdated(audioSettings: AudioSettings):
		AudioSettingsUpdated.emit(audioSettings)

func SendGraphicsSettingsUpdated(graphicsSettings: GraphicsSettings):
		GraphicsSettingsUpdated.emit(graphicsSettings)
