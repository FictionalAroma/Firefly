extends Node

const CONFIG_FILE_PATH: String = "user://config.cfg";

var _config:ConfigFile

var _audioSettings: AudioSettings
var _graphicsSettings: GraphicsSettings


signal AudioSettingsUpdated(audioSettings: AudioSettings)
signal GraphicsSettingsUpdated(graphicsSettings: AudioSettings)

func _ready():
    _config.load(CONFIG_FILE_PATH)
    LoadConfiguration(_config)

    _audioSettings._updateSettingsCallback = func(audioSettings: AudioSettings):
        AudioSettingsUpdated.emit(audioSettings)

    _graphicsSettings._updateSettingsCallback = SendGraphicsSettingsUpdated


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