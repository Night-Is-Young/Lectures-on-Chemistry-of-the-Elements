# 项目定位与 LaTeX 约定

以下为 2026-09-13 阅读时的项目快照，使用前核实当前文件和配置。项目调整后更新此文件，不把旧路径或旧行号当成固定事实。

讲义根目录：`D:/Work/Chemistry/讲义/Lectures on Chemistry of the Elements`。
共用宏文件：`D:/LaTex/texlive/texmf-local/tex/latex/local/EC.sty`。

## 文件地图

- `Chapter 2 p区元素/VIA/VIA.tex` 包含 `O.tex`、`S.tex`、`Se,Te.tex`。分文件各自有 documentclass 与 document 环境，EC 加载 standalone；不要误判这些文档头为重复垃圾。修改后核验实际包含与独立编译行为。
- `Chapter 2 p区元素/VIIA/VIIA.tex` 和 `Chapter 2 p区元素/0/0.tex` 为各自入口，含正文和习题。
- 三个族目录各自有 `ref.bib` 和 `figure/`；不要擅自合并参考文献库。
- `参考资料/` 下有 Greenwood 不同版本和 Housecroft 中文参考资料，按任务读取；存在文件不代表已阅读其内容。

## 需要联动的主题

- HOF：主要内容在 O.tex，VIIA 族引用该安排。
- 多硫阳离子：统一在 Se,Te.tex 介绍，S.tex 只作衔接。
- SF6／XeF6／卤素 AX6E 物种：检查模型、孤对电子空间活性与跨族参照。
- 高溴酸盐的制备：VIIA 与0族 XeF2 内容相互关联。
- 卤键、稀有气体键和多卤阴离子：连接相关概念，避免复制整节。

## 宏与图源

读取实际 EC.sty 后再使用接口：

- `\ce{...}` 排化学式及反应；`\SI{数值}{单位}`、`\si{单位}` 等排单位。已有 `\K`、`\kJm` 等简写，不要求全局转换。
- **`\chemfig{图片名}{缩放}{图题}` 是本项目自定义的插图命令**，从 figure/ 取图，不是同名绘图宏包的语法。
- `\bichemfig{图1}{缩放1}{子题1}{图2}{缩放2}{子题2}{总题}` 排双图。
- `tightcenter` 排反应式；`substance` 可带可选物质名；`problem` 有一个必选标题参数，空标题写 `{}`；`\subproblem` 和 `\subsubproblem` 管理题号。
- 保留中文 label 和已有引用接口。图片有 PNG、EPS、PDF，也有 TikZ 源码；`0/figure/XeF6-MO.tex` 被正文 input。
- 结构图题常含空间群、晶胞参数，修改物相或结构时一起核查。

## 编译和范围

使用 biblatex，backend=biber，style=chem-acs。EC 使用 fontspec、unicode-math 及中文字体，先检查已有 XeLaTeX／LuaLaTeX 配置和本机字体，不直接套用 pdfLaTeX。

VIIA 和0族目录的 latexmkrc 有 EPS 转 PDF 依赖。编译在对应入口目录进行；先核对现有配置，避免产生同名图片冲突或覆盖手工绘制的 PDF。引用页是否输出取决于入口中的 printbibliography，不应因部分文件注释掉它就自动取消注释。

审阅的验证在临时副本中进行。编辑任务保留用户的在途修改；编译失败时区分既有问题和本轮引入的问题。不编辑 bbl、bcf 等生成文件来修补源问题。只改内容时沿用 EC；只有任务确实需要改变共用排版时才修改 EC 并检查其它受影响入口。

完成编辑需验证受影响入口、文献及图片引用，查看受影响 PDF 页面。晶体图、轨道图、长表及题号要做视觉核验；工具不可用时如实记录限制。
