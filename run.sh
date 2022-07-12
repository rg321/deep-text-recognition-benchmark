mon=$(date | cut -d ' ' -f 3)
day=$(date | cut -d ' ' -f 2)
tim=$(date | cut -d ' ' -f 5)

timestamp=$mon${day}_$tim
# echo $timestamp
# echo results_$timestamp.txt



python3 train.py --lr 0.001 --num_iter 5000 --train_data result_train_lettersOnly \
--valid_data result_test_lettersOnly --select_data / --batch_ratio 1 \
--Transformation None --FeatureExtraction VGG --SequenceModeling BiLSTM --Prediction CTC \
--character "abcdefghijklmnopqrstuvwxyz" --valInterval 5 \

# 2>&1 | tee -a results_$timestamp.txt