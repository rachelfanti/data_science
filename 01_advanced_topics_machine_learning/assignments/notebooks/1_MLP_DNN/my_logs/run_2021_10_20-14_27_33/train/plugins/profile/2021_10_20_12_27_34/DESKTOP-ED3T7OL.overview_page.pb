?	~8gDi??~8gDi??!~8gDi??	?\???f:@?\???f:@!?\???f:@"e
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails$~8gDi?????镲??A?p=
ף??Y&䃞ͪ??*43333;x@)      0=2F
Iterator::Model?s????!????uV@)?٬?\m??1?"0[??U@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeatg??j+???!.???r$@)?0?*???1?4?ؼ@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate??ܵ?|??!}l?-\?@)?~j?t???1??&???@:Preprocessing2U
Iterator::Model::ParallelMapV2??ǘ????!????Ŷ @)??ǘ????1????Ŷ @:Preprocessing2Z
#Iterator::Model::ParallelMapV2::ZipǺ?????!??S'@)	?^)?p?1?Nx?????:Preprocessing2?
OIterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate[0]::TensorSlice	?^)?p?!?Nx?????)	?^)?p?1?Nx?????:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensorF%u?k?!b?]d?<??)F%u?k?1b?]d?<??:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMape?X???!_??`N?@)a2U0*?S?1??1#???:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
host?Your program is HIGHLY input-bound because 26.4% of the total step time sampled is waiting for input. Therefore, you should first focus on reducing the input time.no*high2t27.6 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.9?\???f:@>Look at Section 3 for the breakdown of input time on the host.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	???镲?????镲??!???镲??      ??!       "      ??!       *      ??!       2	?p=
ף???p=
ף??!?p=
ף??:      ??!       B      ??!       J	&䃞ͪ??&䃞ͪ??!&䃞ͪ??R      ??!       Z	&䃞ͪ??&䃞ͪ??!&䃞ͪ??JCPU_ONLYY?\???f:@b Y      Y@q>򲧔?S@"?	
host?Your program is HIGHLY input-bound because 26.4% of the total step time sampled is waiting for input. Therefore, you should first focus on reducing the input time.b
`input_pipeline_analyzer (especially Section 3 for the breakdown of input operations on the Host)m
ktrace_viewer (look at the activities on the timeline of each Host Thread near the bottom of the trace view)"T
Rtensorflow_stats (identify the time-consuming operations executed on the CPU_ONLY)"Z
Xtrace_viewer (look at the activities on the timeline of each CPU_ONLY in the trace view)*?
?<a href="https://www.tensorflow.org/guide/data_performance_analysis" target="_blank">Analyze tf.data performance with the TF Profiler</a>*y
w<a href="https://www.tensorflow.org/guide/data_performance" target="_blank">Better performance with the tf.data API</a>2?
=type.googleapis.com/tensorflow.profiler.GenericRecommendation?
nohigh"t27.6 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.:
Refer to the TF2 Profiler FAQb?78.3997% of Op time on the host used eager execution. Performance could be improved with <a href="https://www.tensorflow.org/guide/function" target="_blank">tf.function.</a>2"CPU: B 