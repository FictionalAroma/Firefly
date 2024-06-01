extends CanvasLayer


@onready var health_bar = $health_bar
@onready var mana_bar = $mana_bar
@onready var day_label = $day_label
@onready var score_label = $score_label

func update_hp(hp):
	health_bar.value = hp

func update_score(new_score):
	score_label.text = str("SCORE: " + new_score)

func update_day(new_day):
	day_label.text = str("DAY: " + new_day)
