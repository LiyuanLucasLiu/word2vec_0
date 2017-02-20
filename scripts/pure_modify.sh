count=0
for resample in 10 15
do
	for IterNum in 30 60 90 120
	do
		for negative in 10 15 20
		do
			for dropout in 0 0.3 0.5 0.6 0.7
			do
			# for learning_rate in 0.025 0.0125 0.008
			# do
				echo $IterNum " " $negative " " $resample " " $dropout " " $count " in 27 "
				>&2 echo $count " in 60 "
			# echo "kl:"
				echo "1"
				../bin/rmodify -train /shared/data/ll2/CoType/data/intermediate/KBP/pure_train.data -test /shared/data/ll2/CoType/data/intermediate/KBP/pure_test.data -threads 20 -NONE_idx 6 -cleng 50 -lleng 100 -negative $negative -resample $resample -ignore_none 1 -iter $IterNum -alpha 0.025 -normL 0 -debug 1 -instances 133955 -test_instances 2031 -dropout $dropout
				echo "2"
				../bin/rmodify -train /shared/data/ll2/CoType/data/intermediate/KBP/pure_train.data -test /shared/data/ll2/CoType/data/intermediate/KBP/pure_test.data -threads 20 -NONE_idx 6 -cleng 30 -lleng 50 -negative $negative -resample $resample -ignore_none 1 -iter $IterNum -alpha 0.025 -normL 0 -debug 1 -instances 133955 -test_instances 2031 -dropout $dropout
				echo "3"
				../bin/rmodify -train /shared/data/ll2/CoType/data/intermediate/KBP/pure_train.data -test /shared/data/ll2/CoType/data/intermediate/KBP/pure_test.data -threads 20 -NONE_idx 6 -cleng 100 -lleng 300 -negative $negative -resample $resample -ignore_none 1 -iter $IterNum -alpha 0.025 -normL 0 -debug 1 -instances 133955 -test_instances 2031 -dropout $dropout
			# echo "margin:"
			# ../bin/mmodify -train /shared/data/ll2/CoType/data/intermediate/KBP/train.data -test /shared/data/ll2/CoType/data/intermediate/KBP/test.data -threads 20 -NONE_idx 6 -cleng 30 -lleng 50 -lambda1 $lambda1 -resample $resample -ignore_none 1 -iter $IterNum -alpha 0.025 -normL 2 -debug 1
				count=$((count + 1))
			# done
			done
		done
	done
done

../bin/armodify -train /shared/data/ll2/CoType/data/intermediate/KBP/pure_train.data -test /shared/data/ll2/CoType/data/intermediate/KBP/pure_test.data -threads 20 -NONE_idx 6 -cleng 50 -lleng 100 -negative 10 -resample 10 -ignore_none 1 -iter 100 -alpha 0.025 -normL 0 -debug 2 -instances 133955 -test_instances 2031 -dropout 0.3