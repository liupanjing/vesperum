# Vesperum

> A 2.5D narrative RPG concept about justice, public memory, power, and the cost of being called a hero.

Vesperum is an early-stage game project. The repository currently contains the first version of the game design documents, concept art, production templates, and a minimal Godot demo scaffold.

This is not a playable release yet.

## Language

- [English](#english)
- [中文](#中文)

## English

### Overview

Vesperum is a gothic steampunk 2.5D narrative RPG set eighty years after the first Hero defeated the Demon King and ended the old dynasty.

The world now appears peaceful, democratic, lawful, and prosperous. However, the White Towers have started detecting new "Demon King reactions" across the republic.

The player controls a White Tower auditor who is also the thirteenth bearer of the holy sword. The protagonist is not officially a mass-produced Hero. "Hero" is a social title projected onto them by citizens, institutions, victims, believers, and enemies.

The core question is:

> When everyone demands that the Hero stand on their side, who does the Hero actually represent?

### Design Pillars

- **Two-layer value system**: the player sees self-image values such as justice, mercy, order, freedom, truth, stability, and force; the game secretly tracks how different social groups perceive the player.
- **Dynamic opposition**: bosses are not necessarily evil. They may be people or institutions pushed into opposition by the player's choices.
- **Force as fear**: combat power increases through conflict, but a stronger protagonist may also become a source of public fear.
- **No traditional quest checklist**: investigation is tracked through dossiers, files, event logs, and relationship graphs instead of explicit quest markers.
- **Gothic steampunk world**: White Towers, steam trains, airships, glass politics, public reports, holy institutions, and hidden lower districts.

### Current Status

The project is in pre-production and vertical-slice planning.

Current focus:

- Finalize the demo design document.
- Refine the protagonist, world rules, and investigation structure.
- Validate the two-layer value system.
- Define the dynamic boss selection rules.
- Establish the gothic steampunk + pixel/2.5D visual direction.
- Redesign the combat system later as a card-based conflict system.

Demo chapter: **Glass Town**, a model town with zero crime and high happiness. Its perfect public image depends on excluding "cracked people" from official citizenship records.

### Repository Structure

```text
.
├── README.md
├── LICENSE
├── rpg-game-outline.md
├── game-project-docs/
│   ├── 01-project-brief.md
│   ├── 02-technical-architecture.md
│   ├── 03-game-design.md
│   ├── 04-content-bible.md
│   ├── 05-art-bible.md
│   ├── 06-audio-bible.md
│   ├── 07-production-plan.md
│   ├── 08-demo-game-proposal.md
│   ├── assets/art/
│   └── templates/
└── game-demo/
    ├── project.godot
    ├── data/
    ├── docs/
    ├── scenes/
    └── scripts/
```

### Documentation

- [Game Outline](./rpg-game-outline.md)
- [Project Documents Index](./game-project-docs/README.md)
- [Project Brief](./game-project-docs/01-project-brief.md)
- [Technical Architecture](./game-project-docs/02-technical-architecture.md)
- [Game Design](./game-project-docs/03-game-design.md)
- [Content Bible](./game-project-docs/04-content-bible.md)
- [Art Bible](./game-project-docs/05-art-bible.md)
- [Audio Bible](./game-project-docs/06-audio-bible.md)
- [Production Plan](./game-project-docs/07-production-plan.md)
- [Demo Game Proposal](./game-project-docs/08-demo-game-proposal.md)

### Concept Art

- [Gothic steampunk key art](./game-project-docs/assets/art/vesperum-gothic-steam-key-art.png)
- [Pixel art concept sheet](./game-project-docs/assets/art/vesperum-pixel-concept-sheet.png)

These images are visual exploration drafts and are not final production assets.

### Demo Scaffold

The prototype scaffold is located in [game-demo](./game-demo/README.md).

It currently targets Godot 4.x and focuses on data-driven rule validation:

- NPC tags
- Visible player values
- Hidden public ledger
- Choice resolution
- Dynamic boss candidates

The scaffold exists to test rules and structure. It is not a complete playable demo.

### License

This repository is licensed under the [MIT License](./LICENSE).

## 中文

### 项目简介

Vesperum 是一款处于早期企划阶段的哥特蒸汽时代 2.5D 叙事 RPG。故事发生在初代勇者击败魔王、旧王朝覆灭后的第八十年。

世界表面和平、民主、合法、富足，但共和国各地的白塔开始再次检测到“魔王反应”。

玩家扮演一名白塔巡证官，同时也是第十三号圣剑承载者。主角并不是官方量产出来的勇者。“勇者”是市民、制度、受害者、信徒和敌人不断投射到主角身上的社会称呼。

核心问题是：

> 当所有人都要求勇者站在自己这边时，勇者到底代表谁？

### 设计核心

- **双层数值系统**：玩家能看到正义、怜悯、秩序、自由、真实、稳定、武力等自我认知数值；系统会隐藏记录不同群众如何看待玩家。
- **动态对立面**：Boss 不一定是邪恶者，也可能是被玩家选择推向对立面的个人、组织或制度。
- **武力即恐惧**：战斗会让主角变强，但越强的主角也可能越像一种公共恐惧。
- **非传统任务列表**：游戏不使用传统任务清单和明确路标，而是通过人物档案、文件日志、事件记录和关系图推进调查。
- **哥特蒸汽世界观**：白塔、蒸汽火车、飞艇、玻璃政治、公共报告、神圣制度和被隐藏的下层区域共同构成世界气质。

### 当前状态

项目目前处于企划和垂直切片准备阶段。

当前重点：

- 完善 Demo 游戏企划书。
- 继续细化主角身份、世界规则和调查结构。
- 验证双层数值系统。
- 明确动态 Boss 选择规则。
- 确立哥特蒸汽时代 + 像素/2.5D 的视觉方向。
- 后续重新设计以卡牌对战为核心的战斗系统。

Demo 章节暂定为 **玻璃镇**：一个零犯罪、高幸福、秩序井然的共和国模范城镇。它的完美表象建立在“裂纹者制度”之上，被判定会拉低幸福指数、制造不稳定的人会被排除在正式镇民之外。

### 仓库结构

```text
.
├── README.md
├── LICENSE
├── rpg-game-outline.md
├── game-project-docs/
│   ├── 01-project-brief.md
│   ├── 02-technical-architecture.md
│   ├── 03-game-design.md
│   ├── 04-content-bible.md
│   ├── 05-art-bible.md
│   ├── 06-audio-bible.md
│   ├── 07-production-plan.md
│   ├── 08-demo-game-proposal.md
│   ├── assets/art/
│   └── templates/
└── game-demo/
    ├── project.godot
    ├── data/
    ├── docs/
    ├── scenes/
    └── scripts/
```

### 文档导航

- [游戏总大纲](./rpg-game-outline.md)
- [企划文档索引](./game-project-docs/README.md)
- [项目总览](./game-project-docs/01-project-brief.md)
- [技术架构](./game-project-docs/02-technical-architecture.md)
- [系统设计](./game-project-docs/03-game-design.md)
- [世界观与角色设定](./game-project-docs/04-content-bible.md)
- [美术设计文档](./game-project-docs/05-art-bible.md)
- [音乐音效设计文档](./game-project-docs/06-audio-bible.md)
- [制作计划](./game-project-docs/07-production-plan.md)
- [Demo 游戏企划书](./game-project-docs/08-demo-game-proposal.md)

### 概念图

- [哥特蒸汽主视觉](./game-project-docs/assets/art/vesperum-gothic-steam-key-art.png)
- [像素风视觉设定表](./game-project-docs/assets/art/vesperum-pixel-concept-sheet.png)

这些图片是视觉探索稿，不代表最终游戏资产。

### Demo 脚手架

Demo 原型位于 [game-demo](./game-demo/README.md)。

当前工程目标是先验证规则结构：

- NPC 标签系统
- 玩家可见数值
- 隐藏群众账本
- 选择结算
- 动态 Boss 候选判定

该工程只是规则原型脚手架，不是完整可玩 Demo。

### 许可证

本仓库使用 [MIT License](./LICENSE)。
