extends Button

var next_language_index: int = 1
var languages : Array[String] = ["fr", "en", "es","de", "ja", "ko", "it", "ru"]

func _on_button_up():
	change_language(languages[next_language_index])
	next_language_index = (next_language_index + 1) % languages.size()

func change_language(lang: String) -> void:
	TranslationServer.set_locale(lang)
