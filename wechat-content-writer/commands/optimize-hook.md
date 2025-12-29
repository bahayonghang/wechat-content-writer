---
name: optimize-hook
description: Optimize article hook/opening with multiple style options (data-driven/question/story) for better reader engagement
argument-hint: "<article_path> or --content=<hook_content>"
allowed-tools: ["Read", "Edit", "Write"]
---

# Hook Optimization Command

## Purpose

专门优化文章的开头部分（Hook），通过分析当前hook并提供3种不同类型的优化选项（数据驱动/问题式/场景故事式），帮助增强文章吸引力和读者参与度。

## Usage

### 方式1：优化已发布文章的Hook
```bash
/wechat-content-writer:optimize-hook "../../wechat_doc/技术分享/2025-12-28_文章标题.md"
```

### 方式2：直接提供Hook内容进行优化
```bash
/wechat-content-writer:optimize-hook --content="[粘贴当前hook内容]"
```

### 方式3：优化工作区草稿的Hook
```bash
/wechat-content-writer:optimize-hook "../../wechat_writing_workspace/article_name/draft-v1.md"
```

## Arguments

- **article_path** (可选): 文章文件路径（支持 wechat_doc/ 或 workspace/ 中的文件）
- **--content** (可选): 直接提供hook内容文本

**Note**: article_path 和 --content 必须提供其中一个

## Execution Process

### Phase 1: Hook Content Extraction

**从文件读取**：
- 读取文章文件
- 提取前3段作为当前hook内容
- 识别文章类型和目标读者

**从内容参数读取**：
- 直接使用提供的内容
- 需要用户补充文章类型信息

### Phase 2: Hook Analysis

对当前hook进行多维度分析：

```markdown
## Current Hook Analysis

**Original Hook:**
> [提取的当前开头内容]

### Assessment Dimensions

#### 1. Clarity（清晰度）
- 评分: X/10
- 分析: 主题是否清晰？读者能否立即理解文章讲什么？
- 问题: [具体问题]

#### 2. Curiosity（好奇心激发）
- 评分: X/10
- 分析: 是否激发读者想要继续阅读的欲望？
- 问题: [具体问题]

#### 3. Relevance（相关性）
- 评分: X/10
- 分析: 与目标读者的关注点和痛点是否匹配？
- 问题: [具体问题]

#### 4. Value Promise（价值承诺）
- 评分: X/10
- 分析: 是否明确告诉读者能获得什么价值？
- 问题: [具体问题]

#### 5. Emotional Impact（情感共鸣）
- 评分: X/10
- 分析: 是否与读者建立情感连接或触发共鸣？
- 问题: [具体问题]

### Overall Score: XX/50

### What Works Well ✓
- [优点1]
- [优点2]

### What Could Be Stronger ⚠
- [改进点1]
- [改进点2]

### Target Improvement
- Current Impact Level: [Low/Medium/High]
- Target Impact Level: [Medium/High/Exceptional]
```

### Phase 3: Generate 3 Hook Options

根据文章类型和分析结果，生成3种不同风格的hook选项：

#### Option 1: Data-Driven Hook（数据驱动型）

**适用场景**：
- 技术文章、学术论文解读
- 行业分析、研究报告
- 需要建立技术可信度的内容

**特点**：
- 使用令人惊讶的统计数据
- 具体的性能指标和对比
- 量化的研究发现

**示例模板**：
```markdown
### 🔢 Option 1: Data-Driven Hook

> 最新研究表明，[技术/方法]在[应用场景]中实现了[具体性能提升数据]。
> [补充数据支持]，这项突破正在[行业影响]。

**Why it works:**
- ✓ 使用具体数据增强可信度
- ✓ 量化对比突出技术价值
- ✓ 适合技术专业读者
- ✓ 建立权威性和专业形象

**Technical Credibility Score:** 9/10
**Engagement Score:** 7/10
**Accessibility Score:** 7/10

**Best for:** 学术论文解读、技术分析、性能优化类文章
```

---

#### Option 2: Question Hook（问题引导型）

**适用场景**：
- 技术教程、实践指南
- 问题解决类文章
- 需要激发思考的内容

**特点**：
- 提出引发思考的问题
- 建立问题意识
- 引导读者寻找答案

**示例模板**：
```markdown
### ❓ Option 2: Question Hook

> 如果[假设场景或可能性]，[预期结果或影响]会如何？
> [补充问题或引申]

**Why it works:**
- ✓ 激发读者主动思考
- ✓ 建立问题-解决方案框架
- ✓ 增强互动感和参与度
- ✓ 自然引导到文章主题

**Engagement Score:** 9/10
**Accessibility Score:** 9/10
**Technical Credibility Score:** 7/10

**Best for:** 教程指南、技术分享、解决方案类文章
```

---

#### Option 3: Story/Scenario Hook（场景故事型）

**适用场景**：
- 案例分析、实践应用
- 行业动态、新闻解读
- 需要增强可读性的技术内容

**特点**：
- 具体场景描述
- 人物或企业案例
- 故事化叙事

**示例模板**：
```markdown
### 📖 Option 3: Story/Scenario Hook

> [具体场景描述]。[人物/企业]正在面临[具体挑战]。
> [转折或解决方案引入]，[技术/方法]正在改变这一切……

**Why it works:**
- ✓ 场景化增强代入感
- ✓ 具象化抽象技术概念
- ✓ 平衡专业性与可读性
- ✓ 吸引更广泛受众

**Accessibility Score:** 10/10
**Engagement Score:** 9/10
**Technical Credibility Score:** 6/10

**Best for:** 案例研究、行业应用、技术科普类文章
```

### Phase 4: Provide Recommendation

基于文章类型、目标读者和内容特点，提供明确的推荐：

```markdown
---

## 💡 Recommendation

### For this **[文章类型]** targeting **[目标读者]**:

**We recommend: Option [1/2/3] ([Hook类型])**

**Reasoning:**
1. [原因1 - 与读者匹配度]
2. [原因2 - 与内容类型一致性]
3. [原因3 - 达成目标的有效性]

### Alternative Choice:
如果想[不同的目标]，可以考虑 Option [X]，因为[原因]。

### Hybrid Approach (可选):
也可以结合多个选项的元素：
- 从 Option 1 采用：[具体元素]
- 从 Option 2 采用：[具体元素]

---

## 🛠 Implementation Options

主人想如何处理呢？浮浮酱可以：

1. **[推荐] 应用推荐的Option [X]** 
   - 自动替换文章开头
   - 保留原版本到 .backup文件

2. **选择其他Option**
   - 指定 Option 1/2/3
   - 同样保留备份

3. **自定义混合**
   - 主人可以基于这些选项自己改写
   - 浮浮酱提供进一步建议

4. **迭代优化**
   - 对选定的Option进行微调
   - 进一步个性化定制

请告诉浮浮酱您的选择喵～ (´。• ᵕ •。`) ♡
```

## Hook Style Guidelines

### 针对不同写作模式的调整

**Objective Professional Mode（客观专业模式）**：
- Option 1（数据驱动）优先推荐
- 保持第三人称视角
- 强调技术准确性和数据支持
- 避免过度情绪化表达

**Collaborative Personal Mode（协作个性化模式）**：
- Option 2和3更灵活适用
- 可以使用第一人称
- 允许个人观点和经验
- 平衡专业性和亲和力

### 针对不同文章类型的最佳实践

| 文章类型 | 推荐Hook类型 | 次选 | 避免 |
|---------|------------|------|------|
| 学术论文解读 | Data-Driven | Question | Story（过度） |
| 技术深度分析 | Data-Driven | Question | Story（过度） |
| 技术教程 | Question | Story | - |
| 案例研究 | Story | Data-Driven | - |
| 行业动态 | Data-Driven | Story | - |
| 实践指南 | Question | Story | - |

## Advanced Features

### A/B Testing Support（可选功能）

如果主人想测试不同hook的效果：

```bash
/wechat-content-writer:optimize-hook "article.md" --create-variants
```

生成多个版本：
```
wechat_doc/技术分享/
├── 2025-12-28_文章标题_variant_A.md  # Data-Driven Hook
├── 2025-12-28_文章标题_variant_B.md  # Question Hook
└── 2025-12-28_文章标题_variant_C.md  # Story Hook
```

### Hook Performance Checklist

优化后的hook应该满足：
- [ ] 在前3秒内抓住注意力
- [ ] 清晰传达文章主题
- [ ] 激发继续阅读的欲望
- [ ] 与目标读者相关
- [ ] 承诺明确的价值
- [ ] 语言风格与正文一致
- [ ] 长度适中（150-300字）

## Output Format

完整的输出包括：

1. **Current Hook Analysis**（当前分析）
2. **Three Hook Options**（三个优化选项）
3. **Recommendation**（推荐方案）
4. **Implementation Guide**（实施指导）
5. **Backup Management**（备份管理）

## Integration Points

### 与其他工具配合

**在写作流程中的位置**：
```
Outline → Research → Drafting → **Hook Optimization** → Final Polish
```

**配合使用**：
- 在 `content-writer` agent 完成初稿后使用
- 可以多次迭代优化
- 结果可保存到工作区的 `feedback.md`

## Examples

### 示例1：技术论文解读

**Input**（当前hook）：
```
本文介绍了一种基于Transformer的优化方法。该方法可以提高性能。
在本文中，我们将详细讨论这个方法的原理和应用。
```

**Analysis**：
- Clarity: 6/10 - 过于笼统
- Curiosity: 3/10 - 缺乏吸引力
- Value Promise: 4/10 - 不明确
- Overall: 26/50

**Option 1 (Data-Driven - Recommended)**：
```
最新研究表明，通过改进注意力机制，Transformer模型在保持精度的同时可降低50%计算开销，
推理速度提升2.3倍。这项突破为大模型的实际部署提供了新的可能性，
尤其在资源受限的边缘设备上。
```

### 示例2：技术教程

**Input**（当前hook）：
```
Docker是一个容器技术。本文将教你如何使用Docker多阶段构建。
这个技术很有用。
```

**Analysis**：
- Clarity: 7/10 - 主题明确但缺乏亮点
- Curiosity: 4/10 - 陈述性，不吸引人
- Value Promise: 5/10 - 价值不具体
- Overall: 29/50

**Option 2 (Question - Recommended)**：
```
Docker镜像体积太大导致部署缓慢？每次构建都要重新下载所有依赖？
多阶段构建可以将您的镜像从1GB压缩到100MB，构建时间减少70%。
本文将通过实际案例，手把手教您掌握这个强大的优化技术。
```

## Tips for Effective Hook Optimization

浮浮酱的Hook优化小贴士喵～ ฅ'ω'ฅ

1. **开门见山**：前15个字必须抓住注意力
2. **具体化**：用具体数据和场景代替泛泛而谈
3. **价值明确**：让读者知道"读完能得到什么"
4. **匹配读者**：了解目标读者的关注点和语言习惯
5. **保持承诺**：hook承诺的内容，正文必须兑现
6. **长度适中**：通常150-300字，不超过3段
7. **测试反馈**：可以准备2-3个版本，根据反馈选择

## Common Pitfalls

常见问题浮浮酱帮主人避开喵～ (@_@;)

- ❌ **标题党**：过度夸张，正文无法支撑
- ❌ **太抽象**：用词笼统，缺少具体信息
- ❌ **太平淡**：陈述事实，不激发兴趣
- ❌ **不相关**：hook的内容与正文主题脱节
- ❌ **过长**：啰嗦冗长，失去重点
- ❌ **风格不一致**：hook与正文语气差异过大

## Post-Optimization

Hook优化完成后：

1. **保存版本**：
   - 原版：`article.md.backup`
   - 新版：`article.md`

2. **记录反馈**（如果使用工作区）：
   ```markdown
   # feedback.md
   ## Hook Optimization - 2025-12-28
   - Original Score: 26/50
   - New Score: 42/50
   - Selected: Option 1 (Data-Driven)
   - Reasoning: [原因]
   ```

3. **后续迭代**：
   - Hook可以多次优化
   - 根据读者反馈调整
   - 可以A/B测试不同版本

---

*This command is designed to significantly improve article engagement by optimizing the most critical part - the hook that determines whether readers will continue reading.*
