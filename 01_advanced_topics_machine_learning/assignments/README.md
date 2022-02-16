Material Advanced Topics in Machine Learning 2021/22
====================================================

### Want to run this project using a Docker image?
Read the [Docker instructions](https://github.com/ageron/handson-ml2/tree/master/docker).

### Want to install this project on your own machine?

Start by installing [Anaconda](https://www.anaconda.com/distribution/) (or [Miniconda](https://docs.conda.io/en/latest/miniconda.html)), [git](https://git-scm.com/downloads), and if you have a TensorFlow-compatible GPU, install the [GPU driver](https://www.nvidia.com/Download/index.aspx).

Next, clone this project by opening a terminal and typing the following commands (do not type the first `$` signs on each line, they just indicate that these are terminal commands):

    $ git clone git@gitlab.inf.unibz.it:atml202122/code.git
    $ cd code

If you want to use a GPU, then edit `environment.yml` (or `environment-windows.yml` on Windows) and replace `tensorflow=2.0.0` with `tensorflow-gpu=2.0.0`. Also replace `tensorflow-serving-api==2.0.0` with `tensorflow-serving-api-gpu==2.0.0`.

Next, run the following commands:

    $ conda env create -f environment.yml # or environment-windows.yml on Windows
    $ conda activate atml_202122
    $ python -m ipykernel install --user --name=python3

Then if you're on Windows, run the following command:

    $ pip install --no-index -f https://github.com/Kojoley/atari-py/releases atari_py

Finally, start Jupyter:

    $ jupyter notebook

If you need further instructions, read the [detailed installation instructions](INSTALL.md).

## Acknowledgements

This repository is based on and extends the accompanying repository of the book *Hands-on Machine Learning with Scikit-Learn, Keras, and TensorFlow*, by Aurelien Geron, 2nd Edition, O'Reilly 2019. Exercises and labs are based on and in some cases extends those from the [Deeplearning Specialisation](https://www.deeplearning.ai/deep-learning-specialization/).
<!-- I would like to thank everyone who contributed to this project, either by providing useful feedback, filing issues or submitting Pull Requests. Special thanks go to Haesun Park who helped on some of the exercise solutions, and to Steven Bunkley and Ziembla who created the `docker` directory. Thanks as well to github user SuperYorio for helping out on the coding exercise solutions. -->
