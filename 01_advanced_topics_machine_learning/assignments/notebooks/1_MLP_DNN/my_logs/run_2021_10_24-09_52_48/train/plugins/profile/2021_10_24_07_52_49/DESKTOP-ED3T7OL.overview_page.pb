?	?|?5^????|?5^???!?|?5^???	?nh+@?nh+@!?nh+@"e
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails$?|?5^???<?R?!???A?}8gD??Y333333??*effff?H@)       =2F
Iterator::Model0*??D??!?:????G@)"??u????1^K/?DA@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::ConcatenateV-???!q????=@) ?o_Ή?1Y1P?M9@:Preprocessing2U
Iterator::Model::ParallelMapV29??v??z?!????*@)9??v??z?1????*@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat????Mb??!?G
&s0@)a??+ey?1???L?(@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip}гY????!e?@	o4J@)??_vOf?1(፦ί@:Preprocessing2?
OIterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate[0]::TensorSliceŏ1w-!_?!?????@)ŏ1w-!_?1?????@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor??H?}]?!???h?@)??H?}]?1???h?@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap? ?	???!???Bw?>@)??H?}M?1???h???:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
both?Your program is MODERATELY input-bound because 13.5% of the total step time sampled is waiting for input. Therefore, you would need to reduce both the input time and other time.no*high2t15.2 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.9?nh+@>Look at Section 3 for the breakdown of input time on the host.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	<?R?!???<?R?!???!<?R?!???      ??!       "      ??!       *      ??!       2	?}8gD???}8gD??!?}8gD??:      ??!       B      ??!       J	333333??333333??!333333??R      ??!       Z	333333??333333??!333333??JCPU_ONLYY?nh+@b Y      Y@q$????kV@"?	
both?Your program is MODERATELY input-bound because 13.5% of the total step time sampled is waiting for input. Therefore, you would need to reduce both the input time and other time.b
`input_pipeline_analyzer (especially Section 3 for the breakdown of input operations on the Host)m
ktrace_viewer (look at the activities on the timeline of each Host Thread near the bottom of the trace view)"T
Rtensorflow_stats (identify the time-consuming operations executed on the CPU_ONLY)"Z
Xtrace_viewer (look at the activities on the timeline of each CPU_ONLY in the trace view)*?
?<a href="https://www.tensorflow.org/guide/data_performance_analysis" target="_blank">Analyze tf.data performance with the TF Profiler</a>*y
w<a href="https://www.tensorflow.org/guide/data_performance" target="_blank">Better performance with the tf.data API</a>2?
=type.googleapis.com/tensorflow.profiler.GenericRecommendation?
nohigh"t15.2 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.:
Refer to the TF2 Profiler FAQb?89.6851% of Op time on the host used eager execution. Performance could be improved with <a href="https://www.tensorflow.org/guide/function" target="_blank">tf.function.</a>2"CPU: B 