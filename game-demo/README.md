# Vesperum Demo 工程

这是游戏 Demo 的正式启动工程。当前阶段目标不是做完整游戏，而是先完成“玻璃镇”垂直切片。

## 当前状态

- 项目阶段：立项启动 / 规则原型。
- 引擎目标：Godot 4.x。
- 脚本目标：GDScript。
- 当前重点：双层数值、NPC 标签、隐藏群众账本、Boss 判定。
- 暂缓模块：战斗系统，等待重新设计。

## 目录结构

```text
game-demo/
  project.godot              Godot 项目文件
  data/glass_town/           玻璃镇原型数据
  docs/                      Demo 开发文档
  scenes/                    Godot 场景
  scripts/core/              核心规则系统
  scripts/prototype/         原型入口脚本
  scripts/ui/                UI 脚本
  assets/art/                美术资源
  assets/audio/              音频资源
```

## 第一个可运行目标

打开项目后运行 `scenes/main.tscn`，控制台应能看到：

1. 初始显性数值。
2. 应用一个玻璃镇选择。
3. 隐藏群众账本变化。
4. BossResolver 给出的候选 Boss。

当前机器 PATH 中未检测到 Godot 命令行，因此本次只创建项目文件，暂不执行引擎验证。

## 相关文档

- [项目启动记录](./docs/PROJECT_KICKOFF.md)
- [第一阶段 Backlog](./docs/BACKLOG.md)
- [战斗系统重设计记录](./docs/COMBAT_REDESIGN.md)
- [原始立项文档包](../game-project-docs/README.md)
- [创意大纲](../rpg-game-outline.md)
