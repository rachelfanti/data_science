#!/usr/bin/env python
# coding: utf-8

# In[2]:


# # Python ≥3.5 is required
import sys
# assert sys.version_info >= (3, 5)

# # Scikit-Learn ≥0.20 is required
# import sklearn
# assert sklearn.__version__ >= "0.20"

# try:
#     # %tensorflow_version only exists in Colab.
#     %tensorflow_version 2.x
# except Exception:
#     pass

# TensorFlow ≥2.0 is required
import tensorflow as tf
# assert tf.__version__ >= "2.0"

# Common imports
import numpy as np
import os

# to make this notebook's output stable across runs
np.random.seed(42)


# In[3]:


# Where to save the figures
PROJECT_ROOT_DIR = "."
LECTURE_ID = "05"
IMAGES_PATH = os.path.join(PROJECT_ROOT_DIR, "images", LECTURE_ID)
os.makedirs(IMAGES_PATH, exist_ok=True)


# In[4]:


import tensorflow as tf
from tensorflow import keras


# In[5]:


fashion_mnist = keras.datasets.fashion_mnist
(X_train_full, y_train_full), (X_test, y_test) = fashion_mnist.load_data()


# In[6]:


X_valid, X_train = X_train_full[:5000] / 255., X_train_full[5000:] / 255.
y_valid, y_train = y_train_full[:5000], y_train_full[5000:]
X_test = X_test / 255.


# In[7]:


model = keras.models.Sequential()
model.add(keras.layers.Flatten(input_shape=[28, 28]))
model.add(keras.layers.Dense(300, activation="relu"))
model.add(keras.layers.Dense(100, activation="relu"))
model.add(keras.layers.Dense(10, activation="softmax"))


# In[8]:


keras.backend.clear_session()
np.random.seed(42)
tf.random.set_seed(42)


# In[9]:


model.summary()


# In[10]:


model.compile(loss="sparse_categorical_crossentropy",
              optimizer=keras.optimizers.SGD(lr=0.01),
              metrics=["accuracy"])


# In[12]:


history = model.fit(X_train, y_train, epochs=1,
                    validation_data=(X_valid, y_valid))


# In[13]:


model.evaluate(X_test, y_test)


# In[14]:


X_new = X_test[:3]
y_proba = model.predict(X_new)
y_proba.round(2)


# In[ ]:




