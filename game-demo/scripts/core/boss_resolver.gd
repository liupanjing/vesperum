class_name BossResolver
extends RefCounted

var state: GameState
var rules := []

func _init(game_state: GameState, boss_rules: Array) -> void:
	state = game_state
	rules = boss_rules

func resolve_candidates(chapter_id: String) -> Array:
	var candidates := []
	for rule in rules:
		if str(rule.get("chapter", "")) != chapter_id:
			continue
		if _conditions_met(rule.get("conditions", [])):
			candidates.append(rule)

	candidates.sort_custom(func(a, b): return int(a.get("priority", 0)) > int(b.get("priority", 0)))
	return candidates

func _conditions_met(conditions: Array) -> bool:
	for condition in conditions:
		if not _condition_met(condition):
			return false
	return true

func _condition_met(condition: Dictionary) -> bool:
	if condition.has("flag"):
		var expected := bool(condition.get("equals", true))
		return state.has_flag(str(condition["flag"])) == expected

	if condition.has("visible_stat"):
		return _compare_value(
			int(state.visible_stats.get(str(condition["visible_stat"]), 0)),
			condition
		)

	if condition.has("ledger_tag"):
		return _compare_value(
			int(state.public_ledger.get(str(condition["ledger_tag"]), 0)),
			condition
		)

	return false

func _compare_value(value: int, condition: Dictionary) -> bool:
	if condition.has("gte") and value < int(condition["gte"]):
		return false
	if condition.has("lte") and value > int(condition["lte"]):
		return false
	if condition.has("gt") and value <= int(condition["gt"]):
		return false
	if condition.has("lt") and value >= int(condition["lt"]):
		return false
	if condition.has("equals") and value != int(condition["equals"]):
		return false
	return true
