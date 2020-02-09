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
  PlotRange -> {0, 8000}, PlotLabel -> "感染变化折线图"];
p2 = ListLinePlot[curedCountRate, Mesh -> All,
  PlotLegends -> cityName, PlotTheme -> "Marketing",
  PlotRange -> {0, 0.3}, PlotLabel -> "治愈率变化曲线图"];
p3 = ListLinePlot[deadCountRate, Mesh -> All,
  PlotLegends -> cityName, PlotTheme -> "Marketing",
  PlotRange -> {0, 0.2}, PlotLabel -> "死亡率变化曲线图"];
p4 = BarChart[deadCountRate[[#]], ChartLabels -> cityName,
    ColorFunction ->
     Function[{height}, ColorData["Rainbow"][height]]] & /@
  Range[length];
p5 = BarChart[curedCountRate[[#]], ChartLabels -> cityName,
    ColorFunction ->
     Function[{height}, ColorData["Rainbow"][height]]] & /@
  Range[length]; ("curedCount" /. data);
p6 = ListLinePlot[differenceCount, Mesh -> All,
  PlotLegends -> cityName, PlotTheme -> "Marketing",
  PlotRange -> {0, 2000}, PlotLabel -> "感染数变化折线图"]; p6]
