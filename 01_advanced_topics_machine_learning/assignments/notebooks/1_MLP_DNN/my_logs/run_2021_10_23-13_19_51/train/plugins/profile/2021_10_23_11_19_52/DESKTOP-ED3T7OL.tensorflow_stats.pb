"?C
uHostFlushSummaryWriter"FlushSummaryWriter(1     T?@9     T?@A     T?@I     T?@a?(?k?J??i?(?k?J???Unknown?
BHostIDLE"IDLE1?????K?@A?????K?@aE?/????i??<????Unknown
{HostMatMul"'gradient_tape/sequential/dense_2/MatMul(1??????3@9??????3@A??????3@I??????3@a(?$?r?h?i1=???????Unknown
iHostWriteSummary"WriteSummary(133333?3@933333?3@A33333?3@I33333?3@aZ?`h?i?B??????Unknown?
dHostDataset"Iterator::Model(1      :@9      :@A??????3@I??????3@a#?+Ah?i?(?^????Unknown
?HostBiasAddGrad"4gradient_tape/sequential/dense_1/BiasAdd/BiasAddGrad(1ffffff&@9ffffff&@Affffff&@Iffffff&@a(P{?[?i??L?:???Unknown
}HostMatMul")gradient_tape/sequential/dense_1/MatMul_1(1      %@9      %@A      %@I      %@a?%?Ә?Y?iU??+9???Unknown
?HostDataset"?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate(1333333'@9333333'@A??????#@I??????#@a#?+AX?ig?L?Y$???Unknown
?	HostDataset"5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat(1??????$@9??????$@A??????!@I??????!@aoD?/?V?i?kd&]/???Unknown
o
Host_FusedMatMul"sequential/dense/Relu(1      !@9      !@A      !@I      !@a%???o	U?i??'??9???Unknown
^HostGatherV2"GatherV2(1??????@9??????@A??????@I??????@a?????Q?i?2??kB???Unknown
{HostMatMul"'gradient_tape/sequential/dense_1/MatMul(1333333@9333333@A333333@I333333@a?<?8Y?P?iB}5??J???Unknown
sHostDataset"Iterator::Model::ParallelMapV2(1??????@9??????@A??????@I??????@aA	7խO?iK}Z?R???Unknown
yHostMatMul"%gradient_tape/sequential/dense/MatMul(1??????@9??????@A??????@I??????@aA	7խO?i??ϬZ???Unknown
?HostResourceApplyGradientDescent"-SGD/SGD/update_4/ResourceApplyGradientDescent(1??????@9??????@A??????@I??????@a=???6L?i9??a???Unknown
eHost
LogicalAnd"
LogicalAnd(1333333@9333333@A333333@I333333@a???}?;J?il?X?Ih???Unknown?
?HostSquaredDifference"$mean_squared_error/SquaredDifference(1333333@9333333@A333333@I333333@a???}?;J?i??w~?n???Unknown
?HostResourceApplyGradientDescent"-SGD/SGD/update_3/ResourceApplyGradientDescent(1??????@9??????@A??????@I??????@a#?+AH?iZ?B??t???Unknown
?HostResourceApplyGradientDescent"-SGD/SGD/update_5/ResourceApplyGradientDescent(1??????@9??????@A??????@I??????@a#?+AH?i??
?z???Unknown
qHost_FusedMatMul"sequential/dense_1/Relu(1333333@9333333@A333333@I333333@a7??0?HE?i"*?<K????Unknown
lHostIteratorGetNext"IteratorGetNext(1??????@9??????@A??????@I??????@a|??D?i*I??}????Unknown
?HostBiasAddGrad"2gradient_tape/sequential/dense/BiasAdd/BiasAddGrad(1??????@9??????@A??????@I??????@a|??D?i2h?F?????Unknown
uHostSum"$mean_squared_error/weighted_loss/Sum(1333333@9333333@A333333@I333333@a????MC?i?)@????Unknown
?HostResourceApplyGradientDescent"+SGD/SGD/update/ResourceApplyGradientDescent(1ffffff@9ffffff@Affffff@Iffffff@a~???6?B?i????7????Unknown
gHostStridedSlice"strided_slice(1ffffff@9ffffff@Affffff@Iffffff@a~???6?B?i?m?]?????Unknown
?HostResourceApplyGradientDescent"-SGD/SGD/update_2/ResourceApplyGradientDescent(1??????@9??????@A??????@I??????@aY?6PB?i??R}????Unknown
?HostTile"5gradient_tape/mean_squared_error/weighted_loss/Tile_1(1??????@9??????@A??????@I??????@aY?6PB?i?s ?????Unknown
`HostDivNoNan"
div_no_nan(1ffffff
@9ffffff
@Affffff
@Iffffff
@a?`??U@?i?y?)????Unknown
?HostDynamicStitch".gradient_tape/mean_squared_error/DynamicStitch(1ffffff
@9ffffff
@Affffff
@Iffffff
@a?`??U@?i?n>????Unknown
}HostMatMul")gradient_tape/sequential/dense_2/MatMul_1(1ffffff
@9ffffff
@Affffff
@Iffffff
@a?`??U@?i???S????Unknown
?HostReadVariableOp"(sequential/dense_1/MatMul/ReadVariableOp(1ffffff
@9ffffff
@Affffff
@Iffffff
@a?`??U@?i2??i????Unknown
t Host_FusedMatMul"sequential/dense_2/BiasAdd(1??????@9??????@A??????@I??????@a?P=vf?>?i?S?K?????Unknown
x!HostDataset"#Iterator::Model::ParallelMapV2::Zip(1      :@9      :@A      @I      @a??C???=?iO?̪?????Unknown
?"HostResourceApplyGradientDescent"-SGD/SGD/update_1/ResourceApplyGradientDescent(1      @9      @A      @I      @a??C???=?i¤?	?????Unknown
?#HostBiasAddGrad"4gradient_tape/sequential/dense_2/BiasAdd/BiasAddGrad(1333333@9333333@A333333@I333333@ab?I$??<?i?-??B????Unknown
`$HostGatherV2"
GatherV2_1(1      @9      @A      @I      @a:?b?ο8?i^:??Z????Unknown
%HostReluGrad")gradient_tape/sequential/dense_1/ReluGrad(1      @9      @A      @I      @a:?b?ο8?i?F??r????Unknown
}&HostMaximum"(gradient_tape/mean_squared_error/Maximum(1333333@9333333@A333333@I333333@a?Fi?_?7?i?3??j????Unknown
}'HostReluGrad"'gradient_tape/sequential/dense/ReluGrad(1?????? @9?????? @A?????? @I?????? @a|??4?ik?=????Unknown
i(HostMean"mean_squared_error/Mean(1?????? @9?????? @A?????? @I?????? @a|??4?i?R}?????Unknown
?)HostCast"2mean_squared_error/weighted_loss/num_elements/Cast(1?????? @9?????? @A?????? @I?????? @a|??4?is???6????Unknown
t*HostAssignAddVariableOp"AssignAddVariableOp(1       @9       @A       @I       @a?e?3??3?i?R?V?????Unknown
s+HostReadVariableOp"SGD/Cast/ReadVariableOp(1ffffff??9ffffff??Affffff??Iffffff??a~???6?2?i֣p=
????Unknown
?,HostReadVariableOp")sequential/dense_2/BiasAdd/ReadVariableOp(1ffffff??9ffffff??Affffff??Iffffff??a~???6?2?i??A$d????Unknown
?-HostDataset"OIterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate[0]::TensorSlice(1????????9????????A????????I????????a4?????1?i?&>]?????Unknown
?.HostDivNoNan"?gradient_tape/mean_squared_error/weighted_loss/value/div_no_nan(1????????9????????A????????I????????a4?????1?i?X:??????Unknown
|/HostDivNoNan"&mean_squared_error/weighted_loss/value(1????????9????????A????????I????????a4?????1?i??6?????Unknown
v0HostAssignAddVariableOp"AssignAddVariableOp_2(1333333??9333333??A333333??I333333??a?<?8Y?0?i1?]Z-????Unknown
v1HostAssignAddVariableOp"AssignAddVariableOp_1(1????????9????????A????????I????????aA	7խ/?i???7(????Unknown
V2HostCast"Cast(1      ??9      ??A      ??I      ??a??C???-?i?d,g????Unknown
?3HostDataset"AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor(1      ??9      ??A      ??I      ??a??C???-?i9???????Unknown
?4HostReadVariableOp"'sequential/dense/BiasAdd/ReadVariableOp(1      ??9      ??A      ??I      ??a??C???-?iP&ƹ????Unknown
?5HostReadVariableOp"(sequential/dense_2/MatMul/ReadVariableOp(1      ??9      ??A      ??I      ??a??C???-?i?????????Unknown
u6HostReadVariableOp"div_no_nan/ReadVariableOp(1ffffff??9ffffff??Affffff??Iffffff??a(P{?+?i??JwP????Unknown
?7HostReadVariableOp")sequential/dense_1/BiasAdd/ReadVariableOp(1ffffff??9ffffff??Affffff??Iffffff??a(P{?+?i?K??????Unknown
T8HostMul"Mul(1????????9????????A????????I????????a??\)=?)?i[??̧????Unknown
u9HostSub"$gradient_tape/mean_squared_error/sub(1????????9????????A????????I????????a??\)=?)?i&w??C????Unknown
u:HostSum"$gradient_tape/mean_squared_error/Sum(1333333??9333333??A333333??I333333??a?Fi?_?'?i???ƿ????Unknown
;HostFloorDiv")gradient_tape/mean_squared_error/floordiv(1333333??9333333??A333333??I333333??a?Fi?_?'?iNd??;????Unknown
?<HostReadVariableOp"&sequential/dense/MatMul/ReadVariableOp(1333333??9333333??A333333??I333333??a?Fi?_?'?i?ڏ?????Unknown
w=HostReadVariableOp"div_no_nan/ReadVariableOp_1(1????????9????????A????????I????????a]?u???%?i?2??????Unknown
}>HostRealDiv"(gradient_tape/mean_squared_error/truediv(1????????9????????A????????I????????a]?u???%?i???q????Unknown
??HostDataset"/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap(1333333)@9333333)@A      ??I      ??a?e?3??#?i??3ͭ????Unknown
u@HostMul"$gradient_tape/mean_squared_error/Mul(1      ??9      ??A      ??I      ??a?e?3??#?i?????????Unknown
|AHostAssignAddVariableOp"SGD/SGD/AssignAddVariableOp(1????????9????????A????????I????????a4?????!?i??????Unknown
?BHostBroadcastTo",gradient_tape/mean_squared_error/BroadcastTo(1ffffff??9ffffff??Affffff??Iffffff??a(P{??iX??t?????Unknown
aCHostIdentity"Identity(1333333??9333333??A333333??I333333??a?Fi?_??i??ׇ?????Unknown?
wDHostCast"%gradient_tape/mean_squared_error/Cast(1333333??9333333??A333333??I333333??a?Fi?_??i?c֚a????Unknown
wEHostMul"&gradient_tape/mean_squared_error/mul_1(1      ??9      ??A      ??I      ??a?e?3???i?????????Unknown*?C
uHostFlushSummaryWriter"FlushSummaryWriter(1     T?@9     T?@A     T?@I     T?@a=?JP???i=?JP????Unknown?
{HostMatMul"'gradient_tape/sequential/dense_2/MatMul(1??????3@9??????3@A??????3@I??????3@a?3Rv?Jv?i?G7??????Unknown
iHostWriteSummary"WriteSummary(133333?3@933333?3@A33333?3@I33333?3@a???-v?i??<vA????Unknown?
dHostDataset"Iterator::Model(1      :@9      :@A??????3@I??????3@a?	?? v?i??Z?c)???Unknown
?HostBiasAddGrad"4gradient_tape/sequential/dense_1/BiasAdd/BiasAddGrad(1ffffff&@9ffffff&@Affffff&@Iffffff&@a^T?5%8i?iJ@?ܛB???Unknown
}HostMatMul")gradient_tape/sequential/dense_1/MatMul_1(1      %@9      %@A      %@I      %@a/W⢤g?iy?r@Z???Unknown
?HostDataset"?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate(1333333'@9333333'@A??????#@I??????#@a?	?? f?i???Qp???Unknown
?HostDataset"5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat(1??????$@9??????$@A??????!@I??????!@a?lT
d?i?n?[????Unknown
o	Host_FusedMatMul"sequential/dense/Relu(1      !@9      !@A      !@I      !@a,????#c?i?#>?????Unknown
^
HostGatherV2"GatherV2(1??????@9??????@A??????@I??????@a??r??_?iH]?'	????Unknown
{HostMatMul"'gradient_tape/sequential/dense_1/MatMul(1333333@9333333@A333333@I333333@a?A?嚟^?ii@?X????Unknown
sHostDataset"Iterator::Model::ParallelMapV2(1??????@9??????@A??????@I??????@a???s?\?i???.?????Unknown
yHostMatMul"%gradient_tape/sequential/dense/MatMul(1??????@9??????@A??????@I??????@a???s?\?i[U?h+????Unknown
?HostResourceApplyGradientDescent"-SGD/SGD/update_4/ResourceApplyGradientDescent(1??????@9??????@A??????@I??????@a*?^o?Y?i??8 ????Unknown
eHost
LogicalAnd"
LogicalAnd(1333333@9333333@A333333@I333333@a?X??G?W?i[[D?????Unknown?
?HostSquaredDifference"$mean_squared_error/SquaredDifference(1333333@9333333@A333333@I333333@a?X??G?W?i2h?????Unknown
?HostResourceApplyGradientDescent"-SGD/SGD/update_3/ResourceApplyGradientDescent(1??????@9??????@A??????@I??????@a?	?? V?i?I?????Unknown
?HostResourceApplyGradientDescent"-SGD/SGD/update_5/ResourceApplyGradientDescent(1??????@9??????@A??????@I??????@a?	?? V?i.??????Unknown
qHost_FusedMatMul"sequential/dense_1/Relu(1333333@9333333@A333333@I333333@a??e]S?i?l;????Unknown
lHostIteratorGetNext"IteratorGetNext(1??????@9??????@A??????@I??????@aG?E??R?i??`I!???Unknown
?HostBiasAddGrad"2gradient_tape/sequential/dense/BiasAdd/BiasAddGrad(1??????@9??????@A??????@I??????@aG?E??R?i??TW?*???Unknown
uHostSum"$mean_squared_error/weighted_loss/Sum(1333333@9333333@A333333@I333333@a??@|>?Q?i=?vQ3???Unknown
?HostResourceApplyGradientDescent"+SGD/SGD/update/ResourceApplyGradientDescent(1ffffff@9ffffff@Affffff@Iffffff@ap???Q?iu????;???Unknown
gHostStridedSlice"strided_slice(1ffffff@9ffffff@Affffff@Iffffff@ap???Q?i??@knD???Unknown
?HostResourceApplyGradientDescent"-SGD/SGD/update_2/ResourceApplyGradientDescent(1??????@9??????@A??????@I??????@aQ?ު?P?i??@?L???Unknown
?HostTile"5gradient_tape/mean_squared_error/weighted_loss/Tile_1(1??????@9??????@A??????@I??????@aQ?ު?P?iɉU???Unknown
`HostDivNoNan"
div_no_nan(1ffffff
@9ffffff
@Affffff
@Iffffff
@aK?mH?M?i0??W?\???Unknown
?HostDynamicStitch".gradient_tape/mean_squared_error/DynamicStitch(1ffffff
@9ffffff
@Affffff
@Iffffff
@aK?mH?M?i??Ù?c???Unknown
}HostMatMul")gradient_tape/sequential/dense_2/MatMul_1(1ffffff
@9ffffff
@Affffff
@Iffffff
@aK?mH?M?i?ە?bk???Unknown
?HostReadVariableOp"(sequential/dense_1/MatMul/ReadVariableOp(1ffffff
@9ffffff
@Affffff
@Iffffff
@aK?mH?M?ie?g?r???Unknown
tHost_FusedMatMul"sequential/dense_2/BiasAdd(1??????@9??????@A??????@I??????@a K???K?ixfk?y???Unknown
x HostDataset"#Iterator::Model::ParallelMapV2::Zip(1      :@9      :@A      @I      @a??cpLK?ia?h?????Unknown
?!HostResourceApplyGradientDescent"-SGD/SGD/update_1/ResourceApplyGradientDescent(1      @9      @A      @I      @a??cpLK?iJ???N????Unknown
?"HostBiasAddGrad"4gradient_tape/sequential/dense_2/BiasAdd/BiasAddGrad(1333333@9333333@A333333@I333333@a??
ӸJ?i	[?i֍???Unknown
`#HostGatherV2"
GatherV2_1(1      @9      @A      @I      @a?]?]j?F?i ?o?w????Unknown
$HostReluGrad")gradient_tape/sequential/dense_1/ReluGrad(1      @9      @A      @I      @a?]?]j?F?i7/?????Unknown
}%HostMaximum"(gradient_tape/mean_squared_error/Maximum(1333333@9333333@A333333@I333333@a?O?֝E?i%C??????Unknown
}&HostReluGrad"'gradient_tape/sequential/dense/ReluGrad(1?????? @9?????? @A?????? @I?????? @aG?E??B?i?T??:????Unknown
i'HostMean"mean_squared_error/Mean(1?????? @9?????? @A?????? @I?????? @aG?E??B?if?"?????Unknown
?(HostCast"2mean_squared_error/weighted_loss/num_elements/Cast(1?????? @9?????? @A?????? @I?????? @aG?E??B?iuw???????Unknown
t)HostAssignAddVariableOp"AssignAddVariableOp(1       @9       @A       @I       @a??J?B?i?2??0????Unknown
s*HostReadVariableOp"SGD/Cast/ReadVariableOp(1ffffff??9ffffff??Affffff??Iffffff??ap???A?iח??w????Unknown
?+HostReadVariableOp")sequential/dense_2/BiasAdd/ReadVariableOp(1ffffff??9ffffff??Affffff??Iffffff??ap???A?i???????Unknown
?,HostDataset"OIterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate[0]::TensorSlice(1????????9????????A????????I????????a??;a6@?i?S?̽???Unknown
?-HostDivNoNan"?gradient_tape/mean_squared_error/weighted_loss/value/div_no_nan(1????????9????????A????????I????????a??;a6@?i??6?????Unknown
|.HostDivNoNan"&mean_squared_error/weighted_loss/value(1????????9????????A????????I????????a??;a6@?i?)???????Unknown
v/HostAssignAddVariableOp"AssignAddVariableOp_2(1333333??9333333??A333333??I333333??a?A?嚟>?i??7»????Unknown
v0HostAssignAddVariableOp"AssignAddVariableOp_1(1????????9????????A????????I????????a???s?<?i/E?V????Unknown
V1HostCast"Cast(1      ??9      ??A      ??I      ??a??cpL;?i?Q;??????Unknown
?2HostDataset"AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor(1      ??9      ??A      ??I      ??a??cpL;?i^?c????Unknown
?3HostReadVariableOp"'sequential/dense/BiasAdd/ReadVariableOp(1      ??9      ??A      ??I      ??a??cpL;?i?jWx????Unknown
?4HostReadVariableOp"(sequential/dense_2/MatMul/ReadVariableOp(1      ??9      ??A      ??I      ??a??cpL;?i?v???????Unknown
u5HostReadVariableOp"div_no_nan/ReadVariableOp(1ffffff??9ffffff??Affffff??Iffffff??a^T?5%89?iJ-???????Unknown
?6HostReadVariableOp")sequential/dense_1/BiasAdd/ReadVariableOp(1ffffff??9ffffff??Affffff??Iffffff??a^T?5%89?i??2?&????Unknown
T7HostMul"Mul(1????????9????????A????????I????????a4??j7?i?C?????Unknown
u8HostSub"$gradient_tape/mean_squared_error/sub(1????????9????????A????????I????????a4??j7?iף?????Unknown
u9HostSum"$gradient_tape/mean_squared_error/Sum(1333333??9333333??A333333??I333333??a?O?֝5?iέ?:?????Unknown
:HostFloorDiv")gradient_tape/mean_squared_error/floordiv(1333333??9333333??A333333??I333333??a?O?֝5?iŷa?h????Unknown
?;HostReadVariableOp"&sequential/dense/MatMul/ReadVariableOp(1333333??9333333??A333333??I333333??a?O?֝5?i??9?????Unknown
w<HostReadVariableOp"div_no_nan/ReadVariableOp_1(1????????9????????A????????I????????a?f????3?i?u*Ɩ????Unknown
}=HostRealDiv"(gradient_tape/mean_squared_error/truediv(1????????9????????A????????I????????a?f????3?iV)?????Unknown
?>HostDataset"/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap(1333333)@9333333)@A      ??I      ??a??J?2?i??$MQ????Unknown
u?HostMul"$gradient_tape/mean_squared_error/Mul(1      ??9      ??A      ??I      ??a??J?2?i??-??????Unknown
|@HostAssignAddVariableOp"SGD/SGD/AssignAddVariableOp(1????????9????????A????????I????????a??;a60?i?O??????Unknown
?AHostBroadcastTo",gradient_tape/mean_squared_error/BroadcastTo(1ffffff??9ffffff??Affffff??Iffffff??a^T?5%8)?i:G?,????Unknown
aBHostIdentity"Identity(1333333??9333333??A333333??I333333??a?O?֝%?i5L??????Unknown?
wCHostCast"%gradient_tape/mean_squared_error/Cast(1333333??9333333??A333333??I333333??a?O?֝%?i0Q{??????Unknown
wDHostMul"&gradient_tape/mean_squared_error/mul_1(1      ??9      ??A      ??I      ??a??J?"?i     ???Unknown