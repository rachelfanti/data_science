	?B?i?q???B?i?q??!?B?i?q??	=?-???3@=?-???3@!=?-???3@"e
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails$?B?i?q??9??m4???A???????Yd?]K???*	53333?R@2F
Iterator::Model?I+???!ҋCM@)]m???{??1????
?G@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenatea2U0*???!????nT9@)???QI??1???+??2@:Preprocessing2U
Iterator::Model::ParallelMapV2vq?-??!?ek?%?$@)vq?-??1?ek?%?$@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat/n????!?t	68'@)?ZӼ?}?1??Bǻ"@:Preprocessing2?
OIterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate[0]::TensorSlicen??t?!??j??@)n??t?1??j??@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip???H??!?-t???D@)?????g?1O1?/[?@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor_?Q?[?!c7??#?@)_?Q?[?1c7??#?@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap?0?*???!F???c?:@)??H?}M?1?v?S???:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
both?Your program is MODERATELY input-bound because 19.7% of the total step time sampled is waiting for input. Therefore, you would need to reduce both the input time and other time.no*high2t15.9 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.9=?-???3@>Look at Section 3 for the breakdown of input time on the host.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	9??m4???9??m4???!9??m4???      ??!       "      ??!       *      ??!       2	??????????????!???????:      ??!       B      ??!       J	d?]K???d?]K???!d?]K???R      ??!       Z	d?]K???d?]K???!d?]K???JCPU_ONLYY=?-???3@b 