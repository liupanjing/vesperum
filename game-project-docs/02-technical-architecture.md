# 技术选型与架构

## 1. 技术目标

技术方案应优先服务三个目标：

1. 让一个后端开发者能独立推进。
2. 支持复杂叙事状态、NPC 标签和隐藏数值。
3. 能在 3 个月内做出可玩的垂直切片。

不要追求“最强引擎”，而要选择最适合当前项目风险的工具。

## 2. 引擎选型

### 推荐方案：Godot 4.x

推荐使用 Godot 4.x 制作 2.5D Demo。这里的 2.5D 指：3D 场景承载地形、建筑、灯光和景深，角色使用像素 Sprite 或低成本 2D/3D 混合表现，镜头固定为斜俯视/等距视角。项目不采用横版 2D。

优势：

- 免费开源，MIT 许可，商业化压力小。
- 3D 与 2D 混合能力足够，适合制作低成本 2.5D 立体舞台、像素角色、UI 和卡牌对战。
- 场景/节点结构清晰，适合小团队迭代。
- 可用 GDScript 快速开发，也可用 C# 编写更工程化的逻辑。
- 自定义系统自由度高，适合本项目的标签账本和动态 Boss 规则。

注意：

- 如果选择 Godot 4 C#，官方文档说明 C# 项目当前不能导出 Web。
- 如果希望早期发 Web Demo，建议优先 GDScript。
- 如果目标只面向 PC，C# 可以作为备选，但学习资料和 Godot 社区示例更多偏 GDScript。

### 2.5D 实现约束

第一阶段的 2.5D 不等于完整 3D RPG，而应定义为“可控镜头下的立体舞台”。

建议实现方式：

- 场景使用 3D 节点搭建地面、墙体、建筑、玻璃、圣塔和地下空间。
- 镜头使用固定或半固定斜俯视角，优先正交相机，避免自由旋转带来的关卡和美术成本。
- 角色优先使用像素 Sprite、Billboard Sprite 或低成本角色模型，确保远景下轮廓清晰。
- 交互物使用高亮、描边、图标或光照引导，而不是依赖玩家旋转视角寻找。
- 光照、阴影、景深和雾效用于表达“模范城镇”和“地下裂纹”的情绪差异。
- 战斗场景可以复用剧情场景局部，不单独制作大型战斗地图。

不建议第一阶段实现：

- 自由旋转镜头。
- 大型连续 3D 城镇。
- 复杂跳跃、攀爬或平台操作。
- 高精度角色模型和动作捕捉。
- 大量动态物理交互。

### 备选方案对比

| 引擎 | 优点 | 风险 | 结论 |
| --- | --- | --- | --- |
| Godot | 免费、轻量、2D/3D 混合友好、自定义强 | 需要自己搭 RPG 系统和 2.5D 场景规范 | 推荐 |
| RPG Maker MZ | 传统 JRPG 很快能跑起来 | 深度自定义和复杂隐藏账本会受限 | 可做纸面原型，不推荐做主项目 |
| Unity | C# 生态强、2.5D/URP 资料和商业资源多 | 工程复杂度和授权关注点更高 | 如果未来扩团队可考虑 |
| GameMaker | 2D 上手快 | 2.5D 立体舞台和灯光表现不合适 | 不优先 |
| Unreal | 画面强，适合强光影表现 | 对单人 Demo 偏重 | 不推荐第一阶段使用 |

## 3. 脚本语言建议

### 默认推荐：GDScript

适合：

- 快速完成 Demo。
- 想发布 Web Demo。
- 想使用更多 Godot 原生教程和示例。
- 项目规模当前控制在垂直切片。

### 可选：C#

适合：

- 你希望复用后端开发习惯。
- 只做 PC 版。
- 想用更强类型、更工程化的组织方式。

风险：

- Web 导出受限。
- Godot C# 的社区教程数量相对少。
- 对初学 Godot 者来说，先学引擎再学绑定细节，认知负担更大。

建议结论：第一版用 GDScript。核心规则系统写得足够清晰、数据驱动，后续真需要 C# 再迁移核心模块。

## 4. 项目结构建议

```text
game/
  project.godot
  scenes/
    boot/
    town_glass/
    combat/
    ui/
    environment/
  scripts/
    core/
      game_state.gd
      choice_engine.gd
      visible_stats.gd
      public_ledger.gd
      npc_registry.gd
      dossier_registry.gd
      evidence_log.gd
      relationship_graph.gd
      expression_context.gd
      llm_text_service.gd
      boss_resolver.gd
      save_manager.gd
    combat/
      card_combat_controller.gd
      deck.gd
      card.gd
      card_effect.gd
      opponent_ai.gd
    ui/
      stat_panel.gd
      dialogue_box.gd
      choice_menu.gd
      dossier_panel.gd
      relationship_graph_view.gd
      chapter_result.gd
  data/
    choices/
    npcs/
    tags/
    dialogue/
    dossier/
    evidence/
    relationships/
    expression_templates/
    combat/
    bosses/
    chapters/
  assets/
    art/
    models/
    materials/
    shaders/
    audio/
    fonts/
  docs/
```

## 5. 数据驱动原则

本项目的核心不应写死在场景事件里，而应尽量数据驱动。

原因：

- 选择数量会快速增加。
- NPC 标签会不断调整。
- 隐藏数值需要调参。
- Boss 生成规则需要测试。
- 后续章节需要复用系统。

建议采用 JSON、CSV 或 Godot Resource 保存数据。第一阶段可以用 JSON，足够透明，方便用脚本检查。

## 6. 核心数据模型

### NPC

```json
{
  "id": "glass_farmer_01",
  "name": "卡尔",
  "chapter": "glass_town",
  "tags": ["male", "commoner", "poor", "farmer", "father", "order", "victim_family"],
  "base_attitude": 0,
  "dialogue_state": "default"
}
```

### 显性数值

```json
{
  "justice": 18,
  "mercy": 6,
  "order": 22,
  "freedom": 4,
  "truth": 10,
  "stability": 15,
  "force": 12
}
```

### 隐藏群众账本

```json
{
  "poor": -15,
  "farmer": -20,
  "city_resident": 8,
  "official": 12,
  "order": 6,
  "radical": -12,
  "fear_hero": 18
}
```

### 选择

```json
{
  "id": "burn_fields_to_stop_plague",
  "text": "烧毁感染农田，阻止瘟疫扩散",
  "visible_delta": {
    "justice": 8,
    "stability": 6,
    "force": 2
  },
  "ledger_delta": {
    "farmer": -20,
    "poor": -15,
    "city_resident": 8,
    "official": 12,
    "fear_hero": 5
  },
  "flags_set": ["fields_burned"],
  "followup": "glass_plague_contained"
}
```

### Boss 规则

```json
{
  "id": "glass_rebel_leader",
  "chapter": "glass_town",
  "conditions": [
    { "ledger_tag": "poor", "lte": -25 },
    { "ledger_tag": "farmer", "lte": -20 },
    { "visible_stat": "justice", "gte": 15 }
  ],
  "priority": 80,
  "boss_scene": "res://scenes/combat/boss_glass_rebel.tscn"
}
```

## 7. 主要系统

### GameState

统一保存：

- 当前章节。
- 全局 flag。
- 显性数值。
- 隐藏群众账本。
- NPC 状态。
- 队友状态。
- 战斗记录。
- 已触发选择。

### ChoiceEngine

负责：

- 展示可选项。
- 校验选项条件。
- 应用显性数值变化。
- 应用隐藏标签变化。
- 写入 flag。
- 触发后续剧情。

### PublicLedger

负责隐藏账本：

- 按标签累积态度。
- 根据 NPC 标签计算 NPC 对玩家的当前态度。
- 根据恐惧、认同、受益、受损生成 NPC 对话修饰。
- 为 BossResolver 提供聚合数据。

### DossierRegistry

负责人物档案：

- 记录玩家已知人物。
- 保存玩家已知身份、说法、关系和态度文本。
- 只展示玩家已获得的信息，不展示完整隐藏标签。
- 根据剧情推进和玩家调查更新人物档案。

### EvidenceLog

负责文件日志：

- 记录官方文件、民间证言、现场线索、圣塔数据和传闻。
- 为每条记录保存来源、相关人物、相关地点、相关事件。
- 标记与其他记录的冲突，但不判断真伪。

### RelationshipGraph

负责调查关系图：

- 节点包括人物、组织、地点、文件、事件和未解问题。
- 边包括隶属、指控、包庇、受害、获利、目击、矛盾、依赖和恐惧。
- 关系图不提供下一步目标，只提供信息结构。
- 关键选择和 BossResolver 可以读取关系图状态作为条件。

### ExpressionContext

负责整理可交给大模型或文本模板的表达上下文：

- 当前说话者。
- 当前场景。
- 玩家显性状态摘要。
- 可引用的已解锁事实。
- 禁止引用的未解锁事实。
- NPC 态度文本。
- 隐藏账本的抽象结果，例如“恐惧升高”“官方信任下降”。
- 输出用途，例如路人短句、章节结算、关系图说明。

ExpressionContext 不能暴露完整隐藏账本，也不能让大模型看到未解锁真相。

### LLMTextService

负责可选的大模型文本生成。

第一阶段建议只用于开发期离线生成，不进入运行时主流程。

如果未来接入运行时，必须满足：

- 只生成表达文本，不改变游戏状态。
- 输入只能来自 ExpressionContext。
- 输出必须结构化。
- 输出需要校验是否引用未解锁事实。
- 生成结果必须缓存进存档或本地日志，保证可复现。
- 失败时回退到手写模板文本。

### BossResolver

负责章节末 Boss 判定：

1. 读取章节 Boss 规则。
2. 计算符合条件的候选 Boss。
3. 按优先级和冲突规则选择最终 Boss。
4. 输出 Boss 身份、开场对白、战斗条件和结算文本。

### CardCombatController

第一阶段只做小规模卡牌对战：

- 我方：主角牌组 + 1 名队友牌组或支援牌。
- 敌方：1 个 Boss 牌组或 1 个组织牌组。
- 牌类型：基础行动牌、显性数值牌、证据牌、队友牌、群众牌、武力牌。
- 结果：压制、击败、撤退、剧情中断或进入战后裁决。

圣剑不由 CardCombatController 当作普通卡牌处理。圣剑应由独立的裁决流程处理，用于战前、战中或战后直接终止冲突，并写入武力、恐惧勇者和相关隐藏账本。

### DebugPanel

非常建议第一阶段做调试面板。它可以只在开发版显示：

- 当前显性数值。
- 当前隐藏账本。
- NPC 实际态度。
- BossResolver 候选结果。
- 最近 10 次选择记录。

这是后端开发者的优势。没有调试面板，复杂叙事系统会很难调。

## 8. 存档系统

Demo 阶段需要最小存档：

- 自动存档：章节关键节点。
- 手动存档：可选。
- Debug 快照：用于测试不同选择路径。

建议保存为 JSON，便于排查。

## 9. 版本控制

必须使用 Git。

建议分支：

- `main`：稳定可运行版本。
- `dev`：日常开发。
- `prototype/*`：实验系统。

建议提交粒度：

- 一个系统一个提交。
- 一个剧情节点一个提交。
- 素材导入单独提交。

## 10. 素材授权管理

从第一天就建立素材登记表。

字段：

- 文件路径。
- 作者。
- 来源链接。
- 许可证。
- 是否允许商用。
- 是否需要署名。
- 是否可修改。
- 是否可再分发。

不要等 Demo 快发布时再查授权。那会非常痛苦。

## 11. 推荐开发工具

- 引擎：Godot 4.x。
- 代码编辑：VS Code 或 Godot 内置编辑器。
- 版本控制：Git。
- 任务管理：GitHub Issues、Linear、Notion 或本地 Markdown。
- 表格数据：CSV / Google Sheets / LibreOffice。
- 像素图：Aseprite、LibreSprite、Pixelorama。
- 位图绘制：Krita、Clip Studio Paint、Photoshop。
- 音频剪辑：Audacity、Reaper。
- 文本剧情：Markdown、Yarn Spinner 或自定义 JSON。

## 12. 技术里程碑

### T0：纯文本规则原型

目标：不进引擎，先用脚本跑通选择。

输出：

- NPC 标签表。
- 选择表。
- 显性数值结算。
- 隐藏账本结算。
- Boss 判定结果。

### T1：Godot 灰盒原型

目标：能走、能对话、能选择、能进入卡牌对战。

输出：

- 一个小地图。
- 对话框。
- 选择菜单。
- 数值变化。
- 简单卡牌对战。

### T2：玻璃镇垂直切片

目标：一个完整章节闭环。

输出：

- 完整剧情。
- 可变 Boss。
- 武力恐惧反馈。
- 章节结算。
- 可给测试玩家体验。
