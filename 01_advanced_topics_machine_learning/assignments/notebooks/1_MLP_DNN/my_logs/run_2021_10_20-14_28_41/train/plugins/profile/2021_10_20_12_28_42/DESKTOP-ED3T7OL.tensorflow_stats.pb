"?C
uHostFlushSummaryWriter"FlushSummaryWriter(1????Lݲ@9????Lݲ@A????Lݲ@I????Lݲ@a-J8L??i-J8L???Unknown?
BHostIDLE"IDLE1???????@A???????@a?I??+??i?Q???????Unknown
iHostWriteSummary"WriteSummary(1      7@9      7@A      7@I      7@aѿ'??Nf?i?yl??????Unknown?
dHostDataset"Iterator::Model(1??????9@9??????9@Afffff?2@Ifffff?2@a?ơ??Tb?i6?P
???Unknown
?HostDataset"?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate(1?????L2@9?????L2@Affffff+@Iffffff+@a??ܜ??Z?i???S????Unknown
oHost_FusedMatMul"sequential/dense/Relu(1      )@9      )@A      )@I      )@a??b???X?ik;? ?#???Unknown
?HostResourceApplyGradientDescent"-SGD/SGD/update_1/ResourceApplyGradientDescent(1??????(@9??????(@A??????(@I??????(@a?#3H?W?iV??D?/???Unknown
{HostMatMul"'gradient_tape/sequential/dense_1/MatMul(1??????$@9??????$@A??????$@I??????$@a:!???,T?i?3ڡ?9???Unknown
?	HostDataset"5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat(1??????&@9??????&@A??????#@I??????#@a???S?i?;L@C???Unknown
l
HostIteratorGetNext"IteratorGetNext(1ffffff#@9ffffff#@Affffff#@Iffffff#@a?????R?i64(??L???Unknown
{HostMatMul"'gradient_tape/sequential/dense_2/MatMul(1333333"@9333333"@A333333"@I333333"@a}3?"?Q?i??!|U???Unknown
}HostMatMul")gradient_tape/sequential/dense_1/MatMul_1(1333333!@9333333!@A333333!@I333333!@a*???ԮP?i????]???Unknown
?HostBiasAddGrad"4gradient_tape/sequential/dense_1/BiasAdd/BiasAddGrad(1      @9      @A      @I      @a'?v?M?i????e???Unknown
yHostMatMul"%gradient_tape/sequential/dense/MatMul(1      @9      @A      @I      @aW?;!?(K?iv???k???Unknown
sHostDataset"Iterator::Model::ParallelMapV2(1??????@9??????@A??????@I??????@a???1?J?i?DZA?r???Unknown
^HostGatherV2"GatherV2(1??????@9??????@A??????@I??????@a?t~??I?i3d??y???Unknown
?HostResourceApplyGradientDescent"-SGD/SGD/update_2/ResourceApplyGradientDescent(1ffffff@9ffffff@Affffff@Iffffff@ao??:?I?itP?{???Unknown
?HostResourceApplyGradientDescent"-SGD/SGD/update_4/ResourceApplyGradientDescent(1333333@9333333@A333333@I333333@ah^??CqH?i?T>?????Unknown
`HostGatherV2"
GatherV2_1(1333333@9333333@A333333@I333333@a?BG???F?ix?=.8????Unknown
eHost
LogicalAnd"
LogicalAnd(1ffffff@9ffffff@Affffff@Iffffff@ay7?M?E?i?X??????Unknown?
qHost_FusedMatMul"sequential/dense_1/Relu(1ffffff@9ffffff@Affffff@Iffffff@ay7?M?E?i??/????Unknown
?HostDynamicStitch".gradient_tape/mean_squared_error/DynamicStitch(1??????@9??????@A??????@I??????@a:!???,D?i\?_^ ????Unknown
?HostResourceApplyGradientDescent"-SGD/SGD/update_3/ResourceApplyGradientDescent(1333333@9333333@A333333@I333333@a?
ыp?B?i???:ȟ???Unknown
?HostDataset"OIterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate[0]::TensorSlice(1ffffff@9ffffff@Affffff@Iffffff@a??R???A?i_?ym>????Unknown
?HostBiasAddGrad"2gradient_tape/sequential/dense/BiasAdd/BiasAddGrad(1ffffff@9ffffff@Affffff@Iffffff@a??R???A?i?p??????Unknown
?HostResourceApplyGradientDescent"+SGD/SGD/update/ResourceApplyGradientDescent(1??????@9??????@A??????@I??????@a???*'A?i\Q;*?????Unknown
gHostStridedSlice"strided_slice(1??????@9??????@A??????@I??????@a???*'A?i??=????Unknown
?HostResourceApplyGradientDescent"-SGD/SGD/update_5/ResourceApplyGradientDescent(1      @9      @A      @I      @a?????	??i?|x?????Unknown
xHostDataset"#Iterator::Model::ParallelMapV2::Zip(1     @A@9     @A@A      @I      @aW?;!?(;?iB????????Unknown
}HostMatMul")gradient_tape/sequential/dense_2/MatMul_1(1      @9      @A      @I      @aW?;!?(;?i?ˀ?????Unknown
?HostTile"5gradient_tape/mean_squared_error/weighted_loss/Tile_1(1333333@9333333@A333333@I333333@a7z?p?a:?ib?nH5????Unknown
t Host_FusedMatMul"sequential/dense_2/BiasAdd(1333333@9333333@A333333@I333333@a7z?p?a:?i?\??????Unknown
w!HostCast"%gradient_tape/mean_squared_error/Cast(1??????	@9??????	@A??????	@I??????	@a?c???8?i=??????Unknown
u"HostSub"$gradient_tape/mean_squared_error/sub(1??????	@9??????	@A??????	@I??????	@a?c???8?ii?੶????Unknown
?#HostReadVariableOp")sequential/dense_1/BiasAdd/ReadVariableOp(1      @9      @A      @I      @a?MŮLG7?i?v??????Unknown
s$HostReadVariableOp"SGD/Cast/ReadVariableOp(1??????@9??????@A??????@I??????@aZ,K?^?4?iymJ?=????Unknown
}%HostReluGrad"'gradient_tape/sequential/dense/ReluGrad(1??????@9??????@A??????@I??????@aZ,K?^?4?i?k?????Unknown
?&HostBiasAddGrad"4gradient_tape/sequential/dense_2/BiasAdd/BiasAddGrad(1??????@9??????@A??????@I??????@aZ,K?^?4?iE???z????Unknown
u'HostSum"$mean_squared_error/weighted_loss/Sum(1??????@9??????@A??????@I??????@aZ,K?^?4?i?i?B????Unknown
i(HostMean"mean_squared_error/Mean(1333333@9333333@A333333@I333333@a?
ыp?2?i???0m????Unknown
t)HostAssignAddVariableOp"AssignAddVariableOp(1??????@9??????@A??????@I??????@a???*'1?ik>?u?????Unknown
*HostReluGrad")gradient_tape/sequential/dense_1/ReluGrad(1?????? @9?????? @A?????? @I?????? @a??Vz?K0?iH???????Unknown
?+HostSquaredDifference"$mean_squared_error/SquaredDifference(1       @9       @A       @I       @a?????	/?id?ā?????Unknown
},HostMaximum"(gradient_tape/mean_squared_error/Maximum(1????????9????????A????????I????????aw???(?+?i??QtH????Unknown
?-HostReadVariableOp"&sequential/dense/MatMul/ReadVariableOp(1????????9????????A????????I????????aw???(?+?i???f????Unknown
?.HostReadVariableOp"(sequential/dense_1/MatMul/ReadVariableOp(1????????9????????A????????I????????aw???(?+?i/lY?????Unknown
?/HostReadVariableOp")sequential/dense_2/BiasAdd/ReadVariableOp(1????????9????????A????????I????????aw???(?+?i?2?K?????Unknown
u0HostReadVariableOp"div_no_nan/ReadVariableOp(1333333??9333333??A333333??I333333??a7z?p?a*?i?>?i+????Unknown
u1HostSum"$gradient_tape/mean_squared_error/Sum(1333333??9333333??A333333??I333333??a7z?p?a*?ixJ???????Unknown
?2HostCast"2mean_squared_error/weighted_loss/num_elements/Cast(1333333??9333333??A333333??I333333??a7z?p?a*?iPVޥw????Unknown
?3HostDataset"AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor(1????????9????????A????????I????????a?c???(?ifR??????Unknown
|4HostAssignAddVariableOp"SGD/SGD/AssignAddVariableOp(1      ??9      ??A      ??I      ??a?MŮLG'?i?>
dy????Unknown
?5HostDivNoNan"?gradient_tape/mean_squared_error/weighted_loss/value/div_no_nan(1      ??9      ??A      ??I      ??a?MŮLG'?i+???????Unknown
?6HostReadVariableOp"(sequential/dense_2/MatMul/ReadVariableOp(1      ??9      ??A      ??I      ??a?MŮLG'?ie?Mb????Unknown
v7HostAssignAddVariableOp"AssignAddVariableOp_2(1ffffff??9ffffff??Affffff??Iffffff??ay7?M?%?i?????????Unknown
?8HostBroadcastTo",gradient_tape/mean_squared_error/BroadcastTo(1ffffff??9ffffff??Affffff??Iffffff??ay7?M?%?i??	?????Unknown
?9HostReadVariableOp"'sequential/dense/BiasAdd/ReadVariableOp(1ffffff??9ffffff??Affffff??Iffffff??ay7?M?%?i?>.u????Unknown
v:HostAssignAddVariableOp"AssignAddVariableOp_1(1????????9????????A????????I????????a:!???,$?i?y???????Unknown
?;HostDataset"/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap(1??????3@9??????3@A????????I????????a:!???,$?i?F|??????Unknown
|<HostDivNoNan"&mean_squared_error/weighted_loss/value(1????????9????????A????????I????????a:!???,$?i??=????Unknown
`=HostDivNoNan"
div_no_nan(1333333??9333333??A333333??I333333??a?
ыp?"?i??#?g????Unknown
u>HostMul"$gradient_tape/mean_squared_error/Mul(1333333??9333333??A333333??I333333??a?
ыp?"?i??,?????Unknown
V?HostCast"Cast(1????????9????????A????????I????????a???*'!?i;???????Unknown
}@HostRealDiv"(gradient_tape/mean_squared_error/truediv(1????????9????????A????????I????????a???*'!?iT?ĳ????Unknown
TAHostMul"Mul(1????????9????????A????????I????????aw???(??i!vX=?????Unknown
BHostFloorDiv")gradient_tape/mean_squared_error/floordiv(1????????9????????A????????I????????a?c????i,??Y????Unknown
aCHostIdentity"Identity(1ffffff??9ffffff??Affffff??Iffffff??ay7?M??ivb#?????Unknown?
wDHostReadVariableOp"div_no_nan/ReadVariableOp_1(1      ??9      ??A      ??I      ??a?????	?i=?ك????Unknown
wEHostMul"&gradient_tape/mean_squared_error/mul_1(1      ??9      ??A      ??I      ??a?????	?i     ???Unknown*?C
uHostFlushSummaryWriter"FlushSummaryWriter(1????Lݲ@9????Lݲ@A????Lݲ@I????Lݲ@a??8B(??i??8B(???Unknown?
iHostWriteSummary"WriteSummary(1      7@9      7@A      7@I      7@a3V?}Cbr?ia4??L???Unknown?
dHostDataset"Iterator::Model(1??????9@9??????9@Afffff?2@Ifffff?2@aVvX?6n?i?x?mk???Unknown
?HostDataset"?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate(1?????L2@9?????L2@Affffff+@Iffffff+@a?q ???e?i)y/?????Unknown
oHost_FusedMatMul"sequential/dense/Relu(1      )@9      )@A      )@I      )@ad????c?ir2??????Unknown
?HostResourceApplyGradientDescent"-SGD/SGD/update_1/ResourceApplyGradientDescent(1??????(@9??????(@A??????(@I??????(@a'M觩c?i?.?????Unknown
{HostMatMul"'gradient_tape/sequential/dense_1/MatMul(1??????$@9??????$@A??????$@I??????$@ad??j?`?i⪅G?????Unknown
?HostDataset"5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat(1??????&@9??????&@A??????#@I??????#@aZ?5U_?i钠??????Unknown
l	HostIteratorGetNext"IteratorGetNext(1ffffff#@9ffffff#@Affffff#@Iffffff#@a"$C_?i?$.wk????Unknown
{
HostMatMul"'gradient_tape/sequential/dense_2/MatMul(1333333"@9333333"@A333333"@I333333"@a??{,]?iI?k??????Unknown
}HostMatMul")gradient_tape/sequential/dense_1/MatMul_1(1333333!@9333333!@A333333!@I333333!@a}???~[?i̓??????Unknown
?HostBiasAddGrad"4gradient_tape/sequential/dense_1/BiasAdd/BiasAddGrad(1      @9      @A      @I      @a??]К?W?i??NR? ???Unknown
yHostMatMul"%gradient_tape/sequential/dense/MatMul(1      @9      @A      @I      @a?RK]aV?i?C? ????Unknown
sHostDataset"Iterator::Model::ParallelMapV2(1??????@9??????@A??????@I??????@aqgV0?V?io?????Unknown
^HostGatherV2"GatherV2(1??????@9??????@A??????@I??????@a?????kU?if?	??!???Unknown
?HostResourceApplyGradientDescent"-SGD/SGD/update_2/ResourceApplyGradientDescent(1ffffff@9ffffff@Affffff@Iffffff@a??R??U?i?z?/,???Unknown
?HostResourceApplyGradientDescent"-SGD/SGD/update_4/ResourceApplyGradientDescent(1333333@9333333@A333333@I333333@a?N?m$T?i+?B?A6???Unknown
`HostGatherV2"
GatherV2_1(1333333@9333333@A333333@I333333@a?K?
0?R?iѸGw?????Unknown
eHost
LogicalAnd"
LogicalAnd(1ffffff@9ffffff@Affffff@Iffffff@aWu??}?Q?i??26{H???Unknown?
qHost_FusedMatMul"sequential/dense_1/Relu(1ffffff@9ffffff@Affffff@Iffffff@aWu??}?Q?iGT?nQ???Unknown
?HostDynamicStitch".gradient_tape/mean_squared_error/DynamicStitch(1??????@9??????@A??????@I??????@ad??j?P?i+???Y???Unknown
?HostResourceApplyGradientDescent"-SGD/SGD/update_3/ResourceApplyGradientDescent(1333333@9333333@A333333@I333333@a?6x j?N?i9?R\ka???Unknown
?HostDataset"OIterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate[0]::TensorSlice(1ffffff@9ffffff@Affffff@Iffffff@a??ȕjM?i[Z???h???Unknown
?HostBiasAddGrad"2gradient_tape/sequential/dense/BiasAdd/BiasAddGrad(1ffffff@9ffffff@Affffff@Iffffff@a??ȕjM?i}?_ p???Unknown
?HostResourceApplyGradientDescent"+SGD/SGD/update/ResourceApplyGradientDescent(1??????@9??????@A??????@I??????@a??+?"L?i??h)w???Unknown
gHostStridedSlice"strided_slice(1??????@9??????@A??????@I??????@a??+?"L?i?X??1~???Unknown
?HostResourceApplyGradientDescent"-SGD/SGD/update_5/ResourceApplyGradientDescent(1      @9      @A      @I      @a??UؓI?iL?ȥ?????Unknown
xHostDataset"#Iterator::Model::ParallelMapV2::Zip(1     @A@9     @A@A      @I      @a?RK]aF?i???.????Unknown
}HostMatMul")gradient_tape/sequential/dense_2/MatMul_1(1      @9      @A      @I      @a?RK]aF?ivHnTǏ???Unknown
?HostTile"5gradient_tape/mean_squared_error/weighted_loss/Tile_1(1333333@9333333@A333333@I333333@a3|???E?i?3?6????Unknown
tHost_FusedMatMul"sequential/dense_2/BiasAdd(1333333@9333333@A333333@I333333@a3|???E?i??)?????Unknown
w HostCast"%gradient_tape/mean_squared_error/Cast(1??????	@9??????	@A??????	@I??????	@a@???FvD?ihܣ?ß???Unknown
u!HostSub"$gradient_tape/mean_squared_error/sub(1??????	@9??????	@A??????	@I??????	@a@???FvD?i?NM?????Unknown
?"HostReadVariableOp")sequential/dense_1/BiasAdd/ReadVariableOp(1      @9      @A      @I      @aK"K@?.C?i????????Unknown
s#HostReadVariableOp"SGD/Cast/ReadVariableOp(1??????@9??????@A??????@I??????@aޞC??CA?i;???????Unknown
}$HostReluGrad"'gradient_tape/sequential/dense/ReluGrad(1??????@9??????@A??????@I??????@aޞC??CA?i?Ϯ?N????Unknown
?%HostBiasAddGrad"4gradient_tape/sequential/dense_2/BiasAdd/BiasAddGrad(1??????@9??????@A??????@I??????@aޞC??CA?i???ޟ????Unknown
u&HostSum"$mean_squared_error/weighted_loss/Sum(1??????@9??????@A??????@I??????@aޞC??CA?i??~??????Unknown
i'HostMean"mean_squared_error/Mean(1333333@9333333@A333333@I333333@a?6x j?>?i? ??ƾ???Unknown
t(HostAssignAddVariableOp"AssignAddVariableOp(1??????@9??????@A??????@I??????@a??+?"<?i?c?RK????Unknown
)HostReluGrad")gradient_tape/sequential/dense_1/ReluGrad(1?????? @9?????? @A?????? @I?????? @a0i?<?:?i?p|??????Unknown
?*HostSquaredDifference"$mean_squared_error/SquaredDifference(1       @9       @A       @I       @a??Uؓ9?i?'?5?????Unknown
}+HostMaximum"(gradient_tape/mean_squared_error/Maximum(1????????9????????A????????I????????a()Z?7?iC3w׹????Unknown
?,HostReadVariableOp"&sequential/dense/MatMul/ReadVariableOp(1????????9????????A????????I????????a()Z?7?i?>gy?????Unknown
?-HostReadVariableOp"(sequential/dense_1/MatMul/ReadVariableOp(1????????9????????A????????I????????a()Z?7?i?IW{????Unknown
?.HostReadVariableOp")sequential/dense_2/BiasAdd/ReadVariableOp(1????????9????????A????????I????????a()Z?7?iUG?[????Unknown
u/HostReadVariableOp"div_no_nan/ReadVariableOp(1333333??9333333??A333333??I333333??a3|???5?ib
?r????Unknown
u0HostSum"$gradient_tape/mean_squared_error/Sum(1333333??9333333??A333333??I333333??a3|???5?i??(?????Unknown
?1HostCast"2mean_squared_error/weighted_loss/num_elements/Cast(1333333??9333333??A333333??I333333??a3|???5?iuo݂????Unknown
?2HostDataset"AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor(1????????9????????A????????I????????a@???Fv4?i\?D?????Unknown
|3HostAssignAddVariableOp"SGD/SGD/AssignAddVariableOp(1      ??9      ??A      ??I      ??aK"K@?.3?i?݌?w????Unknown
?4HostDivNoNan"?gradient_tape/mean_squared_error/weighted_loss/value/div_no_nan(1      ??9      ??A      ??I      ??aK"K@?.3?i$??^?????Unknown
?5HostReadVariableOp"(sequential/dense_2/MatMul/ReadVariableOp(1      ??9      ??A      ??I      ??aK"K@?.3?i??;C????Unknown
v6HostAssignAddVariableOp"AssignAddVariableOp_2(1ffffff??9ffffff??Affffff??Iffffff??aWu??}?1?i???*?????Unknown
?7HostBroadcastTo",gradient_tape/mean_squared_error/BroadcastTo(1ffffff??9ffffff??Affffff??Iffffff??aWu??}?1?ifW??????Unknown
?8HostReadVariableOp"'sequential/dense/BiasAdd/ReadVariableOp(1ffffff??9ffffff??Affffff??Iffffff??aWu??}?1?i?
M
?????Unknown
v9HostAssignAddVariableOp"AssignAddVariableOp_1(1????????9????????A????????I????????ad??j?0?iNhz????Unknown
?:HostDataset"/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap(1??????3@9??????3@A????????I????????ad??j?0?i?ŧ"????Unknown
|;HostDivNoNan"&mean_squared_error/weighted_loss/value(1????????9????????A????????I????????ad??j?0?i@#?6????Unknown
`<HostDivNoNan"
div_no_nan(1333333??9333333??A333333??I333333??a?6x j?.?i?*u*!????Unknown
u=HostMul"$gradient_tape/mean_squared_error/Mul(1333333??9333333??A333333??I333333??a?6x j?.?iF2A????Unknown
V>HostCast"Cast(1????????9????????A????????I????????a??+?",?i??'k?????Unknown
}?HostRealDiv"(gradient_tape/mean_squared_error/truediv(1????????9????????A????????I????????a??+?",?ib?:??????Unknown
T@HostMul"Mul(1????????9????????A????????I????????a()Z?'?i?2? ????Unknown
AHostFloorDiv")gradient_tape/mean_squared_error/floordiv(1????????9????????A????????I????????a@???Fv$?i?J?JH????Unknown
aBHostIdentity"Identity(1ffffff??9ffffff??Affffff??Iffffff??aWu??}?!?ii?z?f????Unknown?
wCHostReadVariableOp"div_no_nan/ReadVariableOp_1(1      ??9      ??A      ??I      ??a??Uؓ?i5R=a3????Unknown
wDHostMul"&gradient_tape/mean_squared_error/mul_1(1      ??9      ??A      ??I      ??a??Uؓ?i     ???Unknown