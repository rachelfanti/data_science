	??6?????6???!??6???	]0=? +@]0=? +@!]0=? +@"e
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails$??6???=?U?????A??g??s??Yݵ?|г??*	?????yT@2F
Iterator::Model]m???{??!? 
? 
F@)?!??u???1uS7uS7A@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::ConcatenateZd;?O???!TATA<@)???&??1S-?R-?6@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeatr??????!ʙ?ə?5@)???H??1??i??i3@:Preprocessing2U
Iterator::Model::ParallelMapV2vq?-??!??J??J#@)vq?-??1??J??J#@:Preprocessing2?
OIterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate[0]::TensorSlice"??u??q?!P P @)"??u??q?1P P @:Preprocessing2Z
#Iterator::Model::ParallelMapV2::ZipHP?s??!`??_??K@)?q????o?1?0?0@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor??H?}]?!R?Q?@)??H?}]?1R?Q?@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap??@??ǘ?!?X??X?=@)a2U0*?S?1wqwq??:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
both?Your program is MODERATELY input-bound because 13.5% of the total step time sampled is waiting for input. Therefore, you would need to reduce both the input time and other time.no*moderate2t13.0 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.9]0=? +@>Look at Section 3 for the breakdown of input time on the host.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	=?U?????=?U?????!=?U?????      ??!       "      ??!       *      ??!       2	??g??s????g??s??!??g??s??:      ??!       B      ??!       J	ݵ?|г??ݵ?|г??!ݵ?|г??R      ??!       Z	ݵ?|г??ݵ?|г??!ݵ?|г??JCPU_ONLYY]0=? +@b 