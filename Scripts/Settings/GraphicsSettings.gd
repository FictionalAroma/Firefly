class_name GraphicsSettings extends RefCounted

signal ValuesUpdated(updatedSettings: GraphicsSettings)

const CONFIG_SECTION_NAME:= "GraphicsSettings"

var _dynamicShadowsGlobal: bool = true
var DynamicShadowsGlobal: float:
    get:
        return _dynamicShadowsGlobal;
    set(value):
        _dynamicShadowsGlobal = value;
        SendValuesUpdatedEvent()

var _particlesGlobal: bool = true
var ParticlesEnabledGlobal: float:
    get:
        return _particlesGlobal;
    set(value):
        _particlesGlobal = value;
        SendValuesUpdatedEvent()

func LoadFromConfig(config: ConfigFile) -> void:
    _dynamicShadowsGlobal = config.get_value(CONFIG_SECTION_NAME, "DynamicShadowsGlobal", true)
    _particlesGlobal = config.get_value(CONFIG_SECTION_NAME, "ParticlesGlobal", true)
    SendValuesUpdatedEvent();

func SaveToConfig(config: ConfigFile) -> void:
     config.set_value(CONFIG_SECTION_NAME, "DynamicShadowsGlobal", _dynamicShadowsGlobal)
     config.get_value(CONFIG_SECTION_NAME, "ParticlesGlobal", _particlesGlobal)

func SendValuesUpdatedEvent() -> void:
        ValuesUpdated.emit(self)
