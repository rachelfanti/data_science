	??<,Ԛ????<,Ԛ??!??<,Ԛ??	?ɷۓ#,@?ɷۓ#,@!?ɷۓ#,@"e
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails$??<,Ԛ??[B>?٬??AX?5?;N??Y??D????*	33333sL@2F
Iterator::Model6?;Nё??!?а/F?H@)?I+???1?a_?UC@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate?St$????!?ݫ??,=@)Zd;?O???1oZ?L?54@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat/n????!h??t?.@)??H?}}?1?c2?N)@:Preprocessing2U
Iterator::Model::ParallelMapV2??0?*x?!??E???$@)??0?*x?1??E???$@:Preprocessing2?
OIterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate[0]::TensorSlice??ZӼ?t?!?y??!@)??ZӼ?t?1?y??!@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::ZipV-???!=/Oй{I@)Ǻ???f?1Z???@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor-C??6Z?!?e?~@)-C??6Z?1?e?~@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap?5?;Nё?!?8??x?>@)-C??6J?1?e?~??:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
both?Your program is MODERATELY input-bound because 14.1% of the total step time sampled is waiting for input. Therefore, you would need to reduce both the input time and other time.no*high2t17.9 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.9?ɷۓ#,@>Look at Section 3 for the breakdown of input time on the host.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	[B>?٬??[B>?٬??![B>?٬??      ??!       "      ??!       *      ??!       2	X?5?;N??X?5?;N??!X?5?;N??:      ??!       B      ??!       J	??D??????D????!??D????R      ??!       Z	??D??????D????!??D????JCPU_ONLYY?ɷۓ#,@b 