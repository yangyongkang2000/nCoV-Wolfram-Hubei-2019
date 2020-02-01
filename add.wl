olddata = 
 Import["/Users/yangyongkang/Desktop/olddata.json"]; newdata = 
 Import["/Users/yangyongkang/Desktop/newdata.json"]; \
Export["/Users/yangyongkang/Desktop/olddata.json", 
 Module[{list1 = {"provinceName", "provinceShortName", 
         "confirmedCount", "suspectedCount", "curedCount", 
         "deadCount", "comment"}[[#]] /. {olddata} & /@ Range[7], 
   list2 = {"confirmedCount", "suspectedCount", "curedCount", 
         "deadCount"}[[#]] /. {newdata} & /@ Range[4], 
   list3 = ({"cityName", "confirmedCount", "suspectedCount", 
          "curedCount", 
          "deadCount"}[[#]] /. ("cities" /. {newdata})) & /@ Range[5],
    list4 = ({"confirmedCount", "suspectedCount", "curedCount", 
          "deadCount"}[[#]] /. ("cities" /. {olddata})) & /@ Range[4],
    f, list}, 
  f[m_, n_] := 
   Normal@AssociationThread[{"cityName", "confirmedCount", 
      "suspectedCount", "curedCount", 
      "deadCount"}, {list3[[1]][[m]][[n]], 
      Append[list4[[1]][[m]][[n]], list3[[2]][[m]][[n]]], 
      Append[list4[[2]][[m]][[n]], list3[[3]][[m]][[n]]], 
      Append[list4[[3]][[m]][[n]], list3[[4]][[m]][[n]]], 
      Append[list4[[4]][[m]][[n]], list3[[5]][[m]][[n]]]}]; (Normal@
       AssociationThread[{"provinceName", "provinceShortName", 
         "confirmedCount", "suspectedCount", "curedCount", 
         "deadCount", "comment", "cities"}, {list1[[1]][[#]], 
         list1[[2]][[#]], Append[list1[[3]][[#]], list2[[1]][[#]]], 
         Append[list1[[4]][[#]], list2[[2]][[#]]], 
         Append[list1[[5]][[#]], list2[[3]][[#]]], 
         Append[list1[[6]][[#]], list2[[4]][[#]]], list1[[5]][[#]], 
         f[1, #] & /@ Range[17]}] & /@ Range[1])[[1]]]]