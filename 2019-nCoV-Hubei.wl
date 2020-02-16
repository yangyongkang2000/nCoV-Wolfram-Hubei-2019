(* ::Package:: *)

Module[{data =
    "cities" /. Import["/Users/yangyongkang/Desktop/olddata.json"],
  cityName, curedCountRate, confirmedCount, deadCountRate,
  differenceCount, p1, p2, p3, p4, p5, p6, length},
cityName = "cityName" /. data;
confirmedCount = "confirmedCount" /. data;
differenceCount = Differences /@ confirmedCount;
curedCountRate = N[("curedCount" /. data)/
      confirmedCount /. {Indeterminate -> 0, ComplexInfinity -> 0}];
deadCountRate = N[("deadCount" /. data)/
      confirmedCount /. {Indeterminate -> 0, ComplexInfinity -> 0}];
length = Length@confirmedCount[[1]];
p1 = ListLinePlot[confirmedCount, Mesh -> All,
    PlotLegends -> cityName, PlotTheme -> "Marketing",
    PlotRange -> {0, 50000}, PlotLabel -> "\:6e56\:5317\:5404\:5730\:533a\:6bcf\:65e5\:611f\:67d3\:4eba\:6570\:53d8\:5316\:6298\:7ebf\:56fe"];
p2 = ListLinePlot[curedCountRate, Mesh -> All,
    PlotLegends -> cityName, PlotTheme -> "Marketing",
    PlotRange -> {0, 1}, PlotLabel -> "\:6e56\:5317\:5404\:5730\:533a\:6bcf\:65e5\:6cbb\:6108\:7387\:53d8\:5316\:66f2\:7ebf\:56fe"];
p3 = ListLinePlot[deadCountRate, Mesh -> All,
    PlotLegends -> cityName, PlotTheme -> "Marketing",
    PlotRange -> {0, 0.2}, PlotLabel -> "\:6e56\:5317\:5404\:5730\:533a\:6bcf\:65e5\:6b7b\:4ea1\:7387\:53d8\:5316\:66f2\:7ebf\:56fe"];
p6 = ListLinePlot[differenceCount, Mesh -> All,
    PlotLegends -> cityName, PlotTheme -> "Marketing",
    PlotRange -> {0, 20000}, PlotLabel -> "\:6e56\:5317\:5404\:5730\:533a\:6bcf\:65e5\:65b0\:589e\:611f\:67d3\:4eba\:6570\:53d8\:5316\:6298\:7ebf\:56fe"];
p4 = BoxWhiskerChart[
  Table[#[[k]] & /@ deadCountRate, {k, 1, length}],
  PlotRange -> {0, 0.1}, ChartLabels -> Range@length, Joined -> True,
   PlotTheme -> "Scientific", PlotLabel -> "\:6e56\:5317\:5404\:5730\:533a\:6bcf\:65e5\:6b7b\:4ea1\:7387\:53d8\:5316\:76d2\:987b\:56fe"];
p5 = BoxWhiskerChart[
  Table[#[[k]] & /@ curedCountRate, {k, 1, length}],
  PlotRange -> {0, 0.8}, ChartLabels -> Range@length, Joined -> True,
   PlotTheme -> "Scientific", PlotLabel -> "\:6e56\:5317\:5404\:5730\:533a\:6bcf\:65e5\:6cbb\:6108\:7387\:53d8\:5316\:76d2\:987b\:56fe"];]









