?	+??????+??????!+??????	? ? )@? ? )@!? ? )@"e
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails$+???????m4??@??A?n?????Yn????*	      J@2F
Iterator::Model9??v????!      I@)n????1??؉??B@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate???????!??N??N6@)n????1??؉??2@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat??_?L??!      4@)??y?):??1ى?؉1@:Preprocessing2U
Iterator::Model::ParallelMapV2-C??6z?!ى?؉?(@)-C??6z?1ى?؉?(@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip9??v????!      I@)?~j?t?h?1;?;?@:Preprocessing2?
OIterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate[0]::TensorSlice??H?}]?!;?;?@)??H?}]?1;?;?@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor?~j?t?X?!;?;?@)?~j?t?X?1;?;?@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap ?o_Ή?!?;?;8@)????MbP?1O??N????:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
both?Your program is MODERATELY input-bound because 12.6% of the total step time sampled is waiting for input. Therefore, you would need to reduce both the input time and other time.no*high2t22.9 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.9? ? )@>Look at Section 3 for the breakdown of input time on the host.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	?m4??@???m4??@??!?m4??@??      ??!       "      ??!       *      ??!       2	?n??????n?????!?n?????:      ??!       B      ??!       J	n????n????!n????R      ??!       Z	n????n????!n????JCPU_ONLYY? ? )@b Y      Y@qC??XgUW@"?	
both?Your program is MODERATELY input-bound because 12.6% of the total step time sampled is waiting for input. Therefore, you would need to reduce both the input time and other time.b
`input_pipeline_analyzer (especially Section 3 for the breakdown of input operations on the Host)m
ktrace_viewer (look at the activities on the timeline of each Host Thread near the bottom of the trace view)"T
Rtensorflow_stats (identify the time-consuming operations executed on the CPU_ONLY)"Z
Xtrace_viewer (look at the activities on the timeline of each CPU_ONLY in the trace view)*?
?<a href="https://www.tensorflow.org/guide/data_performance_analysis" target="_blank">Analyze tf.data performance with the TF Profiler</a>*y
w<a href="https://www.tensorflow.org/guide/data_performance" target="_blank">Better performance with the tf.data API</a>2?
=type.googleapis.com/tensorflow.profiler.GenericRecommendation?
nohigh"t22.9 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.:
Refer to the TF2 Profiler FAQb?93.3344% of Op time on the host used eager execution. Performance could be improved with <a href="https://www.tensorflow.org/guide/function" target="_blank">tf.function.</a>2"CPU: B 