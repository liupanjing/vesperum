class_name ChoiceEngine
extends RefCounted

var state: GameState
var choices_by_id := {}

func _init(game_state: GameState, choices: Array) -> void:
	state = game_state
	for choice in choices:
		choices_by_id[str(choice.get("id", ""))] = choice

func apply_choice_by_id(choice_id: String) -> bool:
	if not choices_by_id.has(choice_id):
		push_error("Choice not found: " + choice_id)
		return false

	var choice: Dictionary = choices_by_id[choice_id]
	if not _requirements_met(choice.get("required_flags", [])):
		push_warning("Choice requirements not met: " + choice_id)
		return false

	state.apply_visible_delta(choice.get("visible_delta", {}))
	state.apply_ledger_delta(choice.get("ledger_delta", {}))
	state.set_flags(choice.get("set_flags", []))
	state.clear_flags(choice.get("clear_flags", []))
	state.record_choice(choice_id)
	return true

func _requirements_met(required_flags: Array) -> bool:
	for flag_id in required_flags:
		if not state.has_flag(str(flag_id)):
			return false
	return true
