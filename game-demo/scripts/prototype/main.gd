extends Node

const GameState = preload("res://scripts/core/game_state.gd")
const DataLoader = preload("res://scripts/core/data_loader.gd")
const ChoiceEngine = preload("res://scripts/core/choice_engine.gd")
const BossResolver = preload("res://scripts/core/boss_resolver.gd")

func _ready() -> void:
	var state := GameState.new()
	var loader := DataLoader.new()
	var choices := loader.load_json_array("res://data/glass_town/choices.json")
	var boss_rules := loader.load_json_array("res://data/glass_town/boss_rules.json")
	var choice_engine := ChoiceEngine.new(state, choices)
	var boss_resolver := BossResolver.new(state, boss_rules)

	print("--- Demon Not On Throne Demo Boot ---")
	print("Initial state:")
	print(JSON.stringify(state.to_debug_dict(), "\t"))

	choice_engine.apply_choice_by_id("glass_force_council")

	print("After choice: glass_force_council")
	print(JSON.stringify(state.to_debug_dict(), "\t"))
	print("Boss candidates:")
	print(JSON.stringify(boss_resolver.resolve_candidates("glass_town"), "\t"))
