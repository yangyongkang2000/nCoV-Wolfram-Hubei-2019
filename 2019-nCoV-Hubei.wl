Module[{data =
    "cities" /. Import["/Users/yangyongkang/Desktop/olddata.json"],
  cityName, curedCountRate, confirmedCount, deadCountRate,
  differenceCount, p1, p2, p3, p4, p5, p6, length},
cityName = "cityName" /. data;
confirmedCount = "confirmedCount" /. data;
differenceCount = Differences /@ confirmedCount;
curedCountRate = ("curedCount" /. data)/
      confirmedCount /. {Indeterminate -> 0, ComplexInfinity -> 0};
deadCountRate = ("deadCount" /. data)/
      confirmedCount /. {Indeterminate -> 0, ComplexInfinity -> 0};
length = Length@confirmedCount[[1]];
p1 = ListLinePlot[confirmedCount, Mesh -> All,
    PlotLegends -> cityName, PlotTheme -> "Marketing",
    PlotRange -> {0, 50000}, PlotLabel -> "湖北各地区每日感染人数变化折线图"];
p2 = ListLinePlot[curedCountRate, Mesh -> All,
    PlotLegends -> cityName, PlotTheme -> "Marketing",
    PlotRange -> {0, 1}, PlotLabel -> "湖北各地区每日治愈率变化曲线图"];
p3 = ListLinePlot[deadCountRate, Mesh -> All,
    PlotLegends -> cityName, PlotTheme -> "Marketing",
    PlotRange -> {0, 0.2}, PlotLabel -> "湖北各地区每日死亡率变化曲线图"];
p6 = ListLinePlot[differenceCount, Mesh -> All,
    PlotLegends -> cityName, PlotTheme -> "Marketing",
    PlotRange -> {0, 20000}, PlotLabel -> "湖北各地区每日新增感染人数变化折线图"];
p4 = BoxWhiskerChart[
  Table[#[[k]] & /@ deadCountRate, {k, 1, length}],
  PlotRange -> {0, 0.1}, ChartLabels -> Range@length, Joined -> True,
   PlotTheme -> "Scientific", PlotLabel -> "湖北各地区每日死亡率变化盒须图"];
p5 = BoxWhiskerChart[
  Table[#[[k]] & /@ curedCountRate, {k, 1, length}],
  PlotRange -> {0, 0.8}, ChartLabels -> Range@length, Joined -> True,
   PlotTheme -> "Scientific", PlotLabel -> "湖北各地区每日治愈率变化盒须图"];]






