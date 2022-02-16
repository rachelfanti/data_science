# Drowsiness Detection

An ATML course project to build a system capable of detecting the drowsiness condition in drivers in real time and alarming the driver.

Project done by **Rachel Fanti Coelho Lima** and **Greta Piliponyte**.

## Starting Instructions

#### 1. Clone the repository: https://gitlab.inf.unibz.it/Rachel.FantiCoelhoLima/atml_project.git

#### 2. Navigate to project directory ```cd atml_project```
#### 3. Create the environment: ```conda env create -f environment-windows.yml```

#### 4. Activate environment ```02_atml_project```

#### 5. Open project on Jupyter  ```jupyter notebook```

#### 6. Explore *vgg.ipynb*, *inception_v3.ipynb* and *demo.ipynb* notebooks

## 1. The dataset

The datased selected for the project is the **Drowsiness Detection** image dataset: https://www.kaggle.com/kutaykutlu/drowsiness-detection .

**Example image set**:

![Alt text](saved_statistics/eye_image_examples.PNG?raw=true "Title")

The dataset is a collection of **48000** PNG images. The images are of different sizes (vary from 86x86 to 123x123) 

The images contain **two classes**: *closed* and *open eye* images.

The chosen data splits are: 
- 80% training (38400 images)
- 10% validation (4800 images)
- 10% test (4800 images)

The image collection is divided in to **batches of size 32**

## 2. Data pre-processing

### Pre-processing

In this project we train two Keras transfer learning models: **VGG16** and **Inception_v3**. The preprocessing steps for both models differ based on the model characteristics.

For **Inception_v3** we use *preprocess_input* function from *tensorflow.keras.applications.inception_v3*:
- it scales input pixels between -1 and 1.


For **VGG16** we use *preprocess_input* function from *tensorflow.keras.applications.vgg16*:
- it converts input images to RGB to BGR.
- zero-center each color channel with respect to the ImageNet dataset, without scaling

### Reshaping

We reshape all of the data to fit the models default shape:
- **(299, 299, 3)** for **Inception_v3**
- **(224, 224, 3)** for **VGG16**

### Data augmentation

Data augmentation was applied to the Train set used the *ImageDataGenerator* with the following parameters:
- Rotation range = 0.2
- Shear range = 0.2
- Zoom range = 0.2
- Horizontal flip = True

## 3. Architecture of the model

As mentioned previously in this project two transfer learning are trained: **Inception_v3** and **VGG16**

### Default Architecture of **Inception_v3**

**Inception_v3** is a convolutional neural network architecture from the Inception family. Expects **input of shape (299, 299, 3)**. It consists with several inception modules (Inception Module A, B and C) and is finished with 4 fully-connected layers that shrink the data shape to 1000. The activation function in the last (output) fully-connected layer is Softmax. The model was trained on the *ImageNet* dataset which involves images of 1000 different classes.

![Alt text](saved_statistics/inception_v3.png?raw=true "Title")

### Default architecture of **VGG16**

**VGG16** is a convolutional neural network consisting of convolutional + ReLU, max pooling and fully-connected + ReLU layers. Expects **input of shape (224, 224, 3)**. The activation function in the last (output) fully-connected layer is Softmax. The model was trained on the *ImageNet* dataset which involves images of 1000 different classes.

![Alt text](saved_statistics/vgg16.png?raw=true "Title")


### Tranfer Learning Steps 

The training steps for the two models are identical:
1. load the models with the *ImageNet* weights
2. remove the last layer
3. add a ```Dense(1024, activation='relu')``` layer
4. add a ```Dense(1, activation='sigmoid')``` layer (because we are doing *binary* classification)
5. use ```optimizer='Adam', loss='binary_crossentropy'```
6. train model for **20 epochs with early stopping**


### Live Demo

To show the trained model in action we have constructed a **live web camera demo** using **OpenCV** and **Dlib**.

We use **OpenCV** to interract with the web camera and get individual frames for further image processing. 

Then we use **Dlib**'s ```dlib.get_frontal_face_detector()``` method to detect the face area, and to put a colored frame on the face and eyes. If the face is not found, a message informing about this is shown on the screen.

![Alt text](saved_statistics/demo.PNG?raw=true "Title")

If a **Blib** does detect a face in the frame we its interface to extract both the *left* and the *right eye*. 

The two cropped images of the eyes are then reshaped and preprocessed to comply with **inception_v3** model requirements, and passed to the re-trained model for predictions.

If the retrained *inception_v3** model predicts the **closed_eye** class for both of the eyes, an alarm signal is played.

## 4. Performance of the model

**Due to slightly better performance it was decided to use the Inception_v3 model over the VGG16.**

However, both of these models performed extremely well on the Test data split, arriving to over 99% accuracy.

### Accuracy and Loss (Train & Validation Sets)


|              | Train_acc  | Train_loss | Valid_acc | Valid_loss | Test_acc | Test_loss |
|--------------|------------|------------|-----------|------------|----------|-----------|
| Inception_v3 | 0.9931     | 0.0193     | 0.9908    | 0.0271     | 0.9912   | 0.0266    |
| VGG16        | 0.9922     | 0.0228     | 0.9858    | 0.0445     | 0.9906   | 0.0322    |


### Classification report

![Alt text](saved_statistics/classification_rep.PNG?raw=true "Title")

### Confusion Matrices 

**Inception_v3** confusion matrix:

![Alt text](saved_statistics/inception_v3_conf.png?raw=true "Title")

**VGG16** confusion matrix:

![Alt text](saved_statistics/vgg16_conf.PNG?raw=true "Title")

### ROC Curve

![Alt text](saved_statistics/roc_curve.PNG?raw=true "Title")
## 5. How did we apply different techniques learned in class?

While working on the project we tried to maximally follow the recommendations that were given in the lectures concerning image classification and transfer learning.

### Splitting the data into Train, Valsidation and Test Sets

Traditionally many would have just the Train and Test splits. This has some flaws however, as then we fine tune parameters and judge the final performance based on the same (Test) split. As suggested in the lectures, we split the initial dataset into 3 parts: Train, Validation and Test. In this way we used the training data for the training of the model, validation for hyper parameter tuning and test for judging the final performance of the model after final training has been complete.

### Data Augmentation

We have decided to apply data augmentation techniques to introduce more variety to the training set (not just straight picture of eyes but also some tilting and random cropping)

### Transfer Learning

In the lectures we have learned that Transfer Learning techniques can be extremely effective and time-saving when dealing with domains such as image classification. Following this, we decided to use Transfer Learning models (**Inception_v3** and **VGG16** from *keras*) with *ImageNet* weights to reach the best accuracy possible in a short time. Following the advice from the lectures, we tried to only replace and retrain the last layer and as it gave satisfactory results (over 99% accuracy), we didn't need to unfreeze other lower layers.

### Data Pre-Processing

As suggested in the lectures, we were careful to follow the same data-preprocessing steps as expected from **Inception_v3** and **VGG16** and used their ```preprocess_input``` functions so not to make mistakes. We also were careful to provide input images in the shape the model expected ((299, 299, 3) for **Inception_v3** and (224, 224, 3) for **VGG16**)


### Use Mini-Batch Gradient Descent

In the project we have used Mini-Batch gradient descent as is the recommended variant of gradient descent for most applications, especially in deep learning. We have selected ```batch_size=32``` (a power of 2) so to not waste memory.

By using mini-batches we allow for a more robust convergence, avoiding local minima. Also this way the learning process is more efficient than stochastic gradient descent.


### Optimizer choice

As recommened in the lectures we selected **Adam** as the optimiser.


### Early stopping

We applied early stopping in case the model would plateuo in less epochs than we have set (20).


## 6. Main challenges

#### 1. Get used to the new tools and work with heavy models
Get to know Gitlab, Clusters, Colab


#### 2. Developing a User Friendly Solution
Ideally the detection of drousy driving should happen with use of the user's mobile phone. Following this, we have to use our mobile phone camera for the demo, but the connection speed was too slow to get a good user experience.

### 3. Eye detection
We have tried different face and eye detection systems (various CascadeClassifiers and Dlib)and had to see which one is best by trial and error. In the end we selected Dlib which provided better eye detection with or without glasses than CascadeClassifier.
