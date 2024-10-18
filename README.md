# Dataset-for-Loquat: A dataset for detecting and segmenting surface bruises on loquats
 
## Introduction
This repository is built for:

Dataset-for-Loquat: A dataset for detecting and segmenting surface bruises on loquats

The dataset is in YOLO format.

Dataset-for-Loquat includes images of post-harvest loquats in different backgrounds. The dataset contains 7060 images, of which 6,354 images are the training set and 706 images are the validation set.

## Directory structure
    ├── images           
        ├── train           // Images in the training set
        ├── val           // Images in the validation set
    ├── labels
        ├── train           // Labels corresponding to Images in the training set
        ├── val           // Labels corresponding to Images in the validation set
    ├── train.txt        
    ├── val.txt  
    ├── data.yaml 

## How to use
To train a network on the Dataset-for-Loquat make sure that you download the code first from [yolov9](https://github.com/WongKinYiu/yolov9). And then clone this repository to yolov9 folder and  train a yolov9 network with the commands below.
```
# Clone yolov9 repo and install requirements.txt
git clone https://github.com/WongKinYiu/yolov9  # clone
cd yolov9
pip install -r requirements.txt  # install
# Please uninstall the default torch and download the GPU version of torch from the pytorch website(https://pytorch.org/get-started/locally/).
pip uninstall torch torchvision torchaudio
pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121
```
```
# Clone this repository to yolov9 folder
git clone https://github.com/XiangfeiHuang0213/Dataset-for-Loquat.git
```

```
# Put the data.yaml file into the "data" folder in "yolov9-main" and change the contents of data.yaml to your dataset root dir
# If questions arise during the use of the dataset, please get in touch with hxf0213@outlook.com
```

```
# Train yolov9 original model
python segment/train_dual.py --data data.yaml --batch 2 --weights [string]::Empty --cfg yolov9-c-dseg.yaml --epochs 500 --patience 50 --name yolov9-c-dseg-enhanced --img 896 --hyp hyp.scratch-high.yaml --close-mosaic 15
```
