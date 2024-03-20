#!/bin/bash
# Download command: bash ./scripts/get_datasets_for_train_a_model.sh

# Download/unzip labels
d='./datasets_for_train_a_model' # unzip directory
url=https://tianchi.aliyun.com/dataset/173398
f='k-fold cross validation dataset for loquat.zip' #  285 MB
echo 'Downloading' $url$f ' ...'
curl -L $url$f -o $f && unzip -q $f -d $d && rm $f & # download, unzip, remove in background
