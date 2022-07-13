# python3 train.py --train_data result_train --valid_data result_test --select_data / --batch_ratio 1 --Transformation TPS --FeatureExtraction ResNet --SequenceModeling BiLSTM --Prediction Attn --character "0123456789abcdefghijklmnopqrstuvwxyz\.\-\'"

mon=$(date | cut -d ' ' -f 3)
day=$(date | cut -d ' ' -f 2)
tim=$(date | cut -d ' ' -f 5)

timestamp=$mon${day}_$tim
# echo $timestamp
# echo results_$timestamp.txt

gpu=0
if [ $1 ]
then
	gpu=$1
fi

echo gpu $gpu

CUDA_VISIBLE_DEVICES=$gpu python3 train_skorch.py --lr 0.1 --num_iter 5000 --train_data result_train_lettersOnly \
--valid_data result_test_lettersOnly --select_data / --batch_ratio 1 \
--Transformation None --FeatureExtraction VGG --SequenceModeling BiLSTM --Prediction CTC \
--character "abcdefghijklmnopqrstuvwxyz" --valInterval 5 \

# 2>&1 | tee -a results_$timestamp.txt