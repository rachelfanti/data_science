	?:pΈ???:pΈ??!?:pΈ??	??٥??8@??٥??8@!??٥??8@"e
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails$?:pΈ????1??%??Aa2U0*???Y??ݓ????*	????̄}@2F
Iterator::Model?*??	??!?3{??S@)q???h ??1<???S@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::ConcatenateȘ?????!??Lٍ%@)A??ǘ???1?_?A6?"@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat?J?4??!̬D?t@)???߾??1c?B??4@:Preprocessing2U
Iterator::Model::ParallelMapV2??ǘ????!?8?p@)??ǘ????1?8?p@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zipo???T???!?0jy4@)?? ?rh??1?(??????:Preprocessing2?
OIterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate[0]::TensorSlice9??v??z?!?yJV??)9??v??z?1?yJV??:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensora??+ey?!??? ??)a??+ey?1??? ??:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap?#??????!f?g'?'@)???_vOn?1/?????:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
host?Your program is HIGHLY input-bound because 25.0% of the total step time sampled is waiting for input. Therefore, you should first focus on reducing the input time.no*high2t30.4 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.9??٥??8@>Look at Section 3 for the breakdown of input time on the host.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	??1??%????1??%??!??1??%??      ??!       "      ??!       *      ??!       2	a2U0*???a2U0*???!a2U0*???:      ??!       B      ??!       J	??ݓ??????ݓ????!??ݓ????R      ??!       Z	??ݓ??????ݓ????!??ݓ????JCPU_ONLYY??٥??8@b 