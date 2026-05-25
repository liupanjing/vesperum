class_name GameState
extends RefCounted

var visible_stats := {
	"justice": 0,
	"mercy": 0,
	"order": 0,
	"freedom": 0,
	"truth": 0,
	"stability": 0,
	"force": 0,
}

var public_ledger := {}
var flags := {}
var applied_choices := []

func apply_visible_delta(delta: Dictionary) -> void:
	for key in delta.keys():
		visible_stats[key] = int(visible_stats.get(key, 0)) + int(delta[key])

func apply_ledger_delta(delta: Dictionary) -> void:
	for key in delta.keys():
		public_ledger[key] = int(public_ledger.get(key, 0)) + int(delta[key])

func set_flags(flag_ids: Array) -> void:
	for flag_id in flag_ids:
		flags[str(flag_id)] = true

func clear_flags(flag_ids: Array) -> void:
	for flag_id in flag_ids:
		flags.erase(str(flag_id))

func has_flag(flag_id: String) -> bool:
	return bool(flags.get(flag_id, false))

func record_choice(choice_id: String) -> void:
	applied_choices.append(choice_id)

func to_debug_dict() -> Dictionary:
	return {
		"visible_stats": visible_stats,
		"public_ledger": public_ledger,
		"flags": flags,
		"applied_choices": applied_choices,
	}
