extends Node
const BUS_NAME_MUSIC := "Music"
const BUS_NAME_EFFECT := "Effects"
const BUS_NAME_ALERTS := "Alerts"

const VOLUME_SETTING_MAX := 100.0

@onready var musicBusIndex : int = AudioServer.get_bus_index(BUS_NAME_MUSIC);
@onready var effectsBusIndex : int = AudioServer.get_bus_index(BUS_NAME_EFFECT);
@onready var alertsBusIndex : int= AudioServer.get_bus_index(BUS_NAME_ALERTS);

## SOUND PLAYBACK REFERENCES
@onready var music = $music
@onready var crusade_music = $crusade_music
@onready var cast_fireball_audio = $cast_fireball_audio
@onready var fireball_impact_audio = $fireball_impact_audio
@onready var fireboom_impact = $fireboom_impact




var MusicVolume:float :
	set(value):
		UpdateAudioBusVolume(musicBusIndex, value)

var EffectVolume:float :
	set(value):
		UpdateAudioBusVolume(effectsBusIndex, value)

var AlertVolume:float :
	set(value):
		UpdateAudioBusVolume(alertsBusIndex, value)


func UpdateAudioBusVolume(busIndex:int, amount:float ):
	if is_zero_approx(amount):
		AudioServer.set_bus_mute(busIndex, true)
	else:
		var calcedVolume := log(amount/VOLUME_SETTING_MAX) *20
		AudioServer.set_bus_mute(busIndex, false)
		AudioServer.set_bus_volume_db(busIndex, calcedVolume)
## MUSIC CONTROL
func play_music():
	music.play()
func music_stop():
	music.stop()
func play_crusade_music():
	crusade_music.play()
func stop_crusade_music():
	crusade_music.stop()

## SFX CONTROL
func play_cast_fireball_sound():
	cast_fireball_audio.play()

func play_fireball_impact_audio():
	fireball_impact_audio.play()

func play_fireboom_impact_audio():
	fireboom_impact.play()





