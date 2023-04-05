# AIMA 2021 labs repository

This repository contains the group work submitted for the labs of the [AIMA 2021/22](https://ole.unibz.it/course/view.php?id=9735) course.

## Description

The repository includes the *blueprint* for the lab assignments in the branch `odin` that will be modified by the lecturer only. The material for assignments and activities will be added during the course and pushed to this branch.

To make sure that you will receive the up to date material, you should **never**:

- checkout, delete or modify the `odin` branch (neither locally nor on the remote);
- modify this `README.md` file in the root of the repository (you may create or modify them in the subdirectories).

## Workflow

### Repository update

You can work on any branch you like using any git workflow you're used to, with the proviso that the code that will be submitted **must be** in the `master` branch of this repository. Before working on your assignments you must ensure that your repository is up to date w.r.t. the `odin` branch. That is you should periodically merge any changes that are available in that branch, and you **must** do so before working on lab assignments.

For example, if you're working on a branch named `myWonderfulBranch` (it can be `master` as well), then to make sure that the contents are up to date you should:

1. fetch the `odin` branch from the remote:

    `git fetch origin odin`

2. merge the `odin` branch into the one you're working on:

    ```bash
    git checkout myWonderfulBranch
    git merge origin/odin
    ```

    The first checkout is necessary only if you're not already in the branch you want to work on. Mind that if you're working on different branches you must make sure that `odin` will be merged on all the active ones.

If you stick to the rules in the first paragraph you should never get any conflict; however, if you have any doubt, or things get horribly wrong for some reason, just ask the lecturer for help.

### Submission of your work

To submit your work, first you must create an [annotated tag](https://dev.to/neshaz/a-tutorial-for-tagging-releases-in-git-147e) and *make sure that it's been pushed to the remote*; then you must include the reference to the tag in the description of your submission (additional requirements might be included for specific assignments and they'll be outlined in the description of the assignment).

GitLab enables the use of URLs to access the description of a specific tag (e.g. <https://gitlab.inf.unibz.it/tessaris/wumpus/-/tags/v1.0.0> points to tag `v1.0.0`), or the content of the repository at the commit specified by the tag (e.g. <https://gitlab.inf.unibz.it/tessaris/wumpus/tree/v1.0.0>).

The results of your work must be reproducible, i.e., your submission must include all the requirements (e.g. additional packages must be included in the environment description). One way to verify that is to clone your repo on the [Linux Labs](https://scientificnet.sharepoint.com/sites/Cloudbooks/SitePages/Use-your-PC-Notebook.aspx) virtual machine and verify that's running there as well.

## Contents

- `README.md` description and usage of the repository.
- `environment.yml` definition of the [conda environment](https://docs.conda.io/projects/conda/en/latest/user-guide/getting-started.html#managing-environments) for the labs. If you need to use additional packages you can edit this file. You can setup the environment using the command `conda env create --file environment.yml` and update using `conda env update --file environment.yml --prune`.
- `gym` directory for lab 2022-05-20.
- `ml-text` directory for lab 2022-05-13.
- `planning` directory for the lab 2022-04-08.
- `search` directory for the lab 2022-03-11.
- `smt` directory for lab 2022-04-22.
- `supervised` directory for lab 2022-05-06.
- `wumpus-offline` directory for lab 2022-03-25.
- `wumpus-online` directory for Online Wumpus assignment.

## Changes

- **2022-05-19**: lab 2022-05-20 and update to conda environment
- **2022-05-13**: lab 2022-05-13
- **2022-05-05**: lab 2022-05-06
- **2022-04-22**: lab 2022-04-22 and Online Wumpus assignment
- **2022-04-07**: lab 2022-04-08
- **2022-03-22**: lab 2022-03-25
- **2022-03-10**: initialisation of the repository and lab 2022-03-11
