class_name AudioSettings extends RefCounted


var _updateSettingsCallback: Callable
const CONFIG_SECTION_NAME:= "AudioSettings"

var _musicVolume: float = 0.0
var MusicVolume: float:
    get:
        return _musicVolume;
    set(value):
        _musicVolume = value;
        SendValuesUpdatedEvent()



var _effectsVolume: float = 0.0
var EffectsVolume: float:
    get:
        return _effectsVolume;
    set(value):
        _effectsVolume = value;
        SendValuesUpdatedEvent()

var _alertVolume: float = 0.0
var AlertVolume: float:
    get:
        return _alertVolume;
    set(value):
        _alertVolume = value;
        SendValuesUpdatedEvent()

func SendValuesUpdatedEvent() -> void:
        _updateSettingsCallback.call_deferred(self)

func LoadFromConfig(config: ConfigFile) -> void:
    _musicVolume = config.get_value(CONFIG_SECTION_NAME, "MusicVolume", 50)
    _effectsVolume = config.get_value(CONFIG_SECTION_NAME, "EffectsVolume", 50)
    _alertVolume = config.get_value(CONFIG_SECTION_NAME, "AlertVolume", 50)
    SendValuesUpdatedEvent();

func SaveToConfig(config: ConfigFile) -> void:
     config.get_value(CONFIG_SECTION_NAME, "MusicVolume", _musicVolume)
     config.set_value(CONFIG_SECTION_NAME, "EffectsVolume", _effectsVolume)
     config.set_value(CONFIG_SECTION_NAME, "AlertVolume", _alertVolume)
