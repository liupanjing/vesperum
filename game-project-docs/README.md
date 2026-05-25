# Vesperum 立项文档包

本文档包用于将当前游戏构想推进到可执行项目。当前目标不是立刻制作完整商业游戏，而是先完成一个可验证的垂直切片 Demo，用最小成本验证核心玩法是否成立。

## 当前立项结论

- 当前状态：Demo 立项企划阶段。正式写代码前，应先完善 [Demo 游戏企划书](./08-demo-game-proposal.md)。
- 项目类型：2.5D 叙事 RPG / 卡牌对战 RPG / 半公路式章节结构。
- 推荐引擎：Godot 4.x。
- 推荐脚本：优先 GDScript；如果只做 PC 版且更重视后端式工程组织，可以考虑 C#。
- 第一阶段目标：制作 30-45 分钟的“玻璃镇”垂直切片。
- 核心验证点：双层数值、NPC 标签、武力即恐惧、可变 Boss、章节结算反馈。
- 战斗系统：初步改为卡牌对战方向；圣剑不作为普通战斗武器，而是勇者特有的非战斗裁决能力。
- 大模型策略：只作为表达层，生成传闻、结算文本、档案摘要、路人短句等；不参与真相、数值、Boss 或结局判定。
- 美术策略：2.5D 立体舞台，采用斜俯视场景、像素角色、体积光影和角色半身立绘；不做横版 2D。
- 音乐策略：先用临时素材和主题动机，Demo 成型后再定制主题曲与关键变奏。

注：仓库中已有一个早期 `game-demo/` 工程骨架，但它不代表当前已进入正式开发。后续只有在企划书、战斗系统和 Demo 流程确认后，才应继续推进工程实现。

## 文档索引

1. [项目总览](./01-project-brief.md)
2. [技术选型与架构](./02-technical-architecture.md)
3. [游戏设计文档](./03-game-design.md)
4. [内容与世界观圣经](./04-content-bible.md)
5. [美术设计文档](./05-art-bible.md)
6. [音乐与音效设计文档](./06-audio-bible.md)
7. [制作计划与执行清单](./07-production-plan.md)
8. [Demo 游戏企划书](./08-demo-game-proposal.md)

## 表格模板

- [NPC 标签表模板](./templates/npc-table-template.csv)
- [选择结算表模板](./templates/choice-table-template.csv)
- [Boss 规则表模板](./templates/boss-rules-template.csv)
- [调查档案条目模板](./templates/dossier-entry-template.csv)
- [关系图边表模板](./templates/relationship-graph-template.csv)
- [素材授权登记表模板](./templates/asset-license-register.csv)
- [试玩问卷模板](./templates/playtest-questionnaire.md)

## 与原始大纲的关系

原始创意大纲位于：[rpg-game-outline.md](../rpg-game-outline.md)。

本目录中的文档是正式立项资料，面向执行、协作和拆工；原始大纲保留为创意母稿。

## 外部参考

- Godot 许可说明：<https://godotengine.org/license/>
- Godot Web 导出说明：<https://docs.godotengine.org/en/4.5/tutorials/export/exporting_for_web.html>
- Unity 计划与授权说明：<https://support.unity.com/hc/en-us/articles/28114350573460-Which-Unity-Editor-license-should-I-use-purchase>
- RPG Maker MZ 变量与开关：<https://rpgmakerofficial.com/product/MZ_help-en/01_10_02.html>
- Steam Direct 上架费：<https://partner.steamgames.com/doc/gettingstarted/appfee>
- itch.io 开放收入分成：<https://itch.io/docs/general/about>
- Kenney 素材许可说明：<https://kenney.nl/support>
- OpenGameArt FAQ：<https://opengameart.org/content/faq>
