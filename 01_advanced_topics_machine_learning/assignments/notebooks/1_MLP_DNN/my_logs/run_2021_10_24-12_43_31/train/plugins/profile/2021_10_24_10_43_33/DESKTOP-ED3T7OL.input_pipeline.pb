	c?ZB>???c?ZB>???!c?ZB>???	??8M&@??8M&@!??8M&@"e
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails$c?ZB>??????_vO??A c?ZB>??Y?q??????*	gffff?K@2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::ConcatenatejM????!su??\A@)?J?4??1n???>@:Preprocessing2F
Iterator::ModelHP?sג?!(?!??|@@)F%u???1??~???7@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeatF%u???!??~???7@)Ǻ?????1hI??Y4@:Preprocessing2U
Iterator::Model::ParallelMapV2??_?Lu?!N??S?"@)??_?Lu?1N??S?"@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip???&??!lo??P@)?q????o?1??O???@:Preprocessing2?
OIterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate[0]::TensorSliceHP?s?b?!(?!??|@)HP?s?b?1(?!??|@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor????Mb`?!?ru??@)????Mb`?1?ru??@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMapDio??ɔ?!?´}?0B@)a2U0*?S?15?DM4@:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
both?Your program is MODERATELY input-bound because 11.2% of the total step time sampled is waiting for input. Therefore, you would need to reduce both the input time and other time.no*high2t21.2 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.9??8M&@>Look at Section 3 for the breakdown of input time on the host.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	???_vO?????_vO??!???_vO??      ??!       "      ??!       *      ??!       2	 c?ZB>?? c?ZB>??! c?ZB>??:      ??!       B      ??!       J	?q???????q??????!?q??????R      ??!       Z	?q???????q??????!?q??????JCPU_ONLYY??8M&@b 