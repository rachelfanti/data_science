	?o_????o_???!?o_???	??7`1?<@??7`1?<@!??7`1?<@"e
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails$?o_?????	h"l??A0L?
F%??Y*??D???*	    q@2F
Iterator::Modelx$(~??!'vb'vbT@)pΈ?????1????S@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate?0?*??!??.??.@);?O??n??1??_??_@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensorX?5?;N??!1?0?@)X?5?;N??11?0?@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat?HP???!??!@)???Q?~?1?_??_?@:Preprocessing2U
Iterator::Model::ParallelMapV2a2U0*?s?!?!?!??)a2U0*?s?1?!?!??:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip ?o_Ω?!c'vb'v2@)	?^)?p?1x?x???:Preprocessing2?
OIterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate[0]::TensorSlice??_?Le?!??y??y??)??_?Le?1??y??y??:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMapw-!?l??!?@?@ @)??_?LU?1??y??y??:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
host?Your program is HIGHLY input-bound because 28.9% of the total step time sampled is waiting for input. Therefore, you should first focus on reducing the input time.no*high2t21.0 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.9??7`1?<@>Look at Section 3 for the breakdown of input time on the host.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	??	h"l????	h"l??!??	h"l??      ??!       "      ??!       *      ??!       2	0L?
F%??0L?
F%??!0L?
F%??:      ??!       B      ??!       J	*??D???*??D???!*??D???R      ??!       Z	*??D???*??D???!*??D???JCPU_ONLYY??7`1?<@b 