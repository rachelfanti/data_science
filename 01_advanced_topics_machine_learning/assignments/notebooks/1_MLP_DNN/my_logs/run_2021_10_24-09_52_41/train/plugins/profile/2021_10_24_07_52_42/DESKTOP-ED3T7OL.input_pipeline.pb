	X9??v??X9??v??!X9??v??	?w$??y'@?w$??y'@!?w$??y'@"e
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails$X9??v??M??St$??A?a??4???Y?0?*??*	??????T@2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate]m???{??!?CG??E@)???x?&??1綢?D@:Preprocessing2F
Iterator::Modely?&1???!+=ؙ??@@)$????ۗ?1???`g?;@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat_?Qڋ?!#?k ??0@)?+e?X??1??,	z=+@:Preprocessing2U
Iterator::Model::ParallelMapV2U???N@s?!?-?Jv@)U???N@s?1?-?Jv@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip??ܵ???!j?3?P@);?O??nr?1?X`?@:Preprocessing2?
OIterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate[0]::TensorSlice??_?Le?!????@)??_?Le?1????@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor/n??b?!yq??@)/n??b?1yq??@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMapU???N@??!?-?JvF@)?~j?t?X?1?ru????:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
both?Your program is MODERATELY input-bound because 11.7% of the total step time sampled is waiting for input. Therefore, you would need to reduce both the input time and other time.no*moderate2t12.9 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.9?w$??y'@>Look at Section 3 for the breakdown of input time on the host.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	M??St$??M??St$??!M??St$??      ??!       "      ??!       *      ??!       2	?a??4????a??4???!?a??4???:      ??!       B      ??!       J	?0?*???0?*??!?0?*??R      ??!       Z	?0?*???0?*??!?0?*??JCPU_ONLYY?w$??y'@b 