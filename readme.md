# 3DS-VLA Installation and Usage Guide

This guide provides instructions for setting up the environment, preparing datasets, and running training or evaluation for the 3DS-VLA policy.

## 1. Prerequisites & Environment Setup

1.  **Download Copellism:** Download the Copellism source from the [Peract Repository](https://github.com/peract/peract).
2.  **Set Environment Variable:** Set the directory path in your environment variables:
    ```bash
    export COPELLISM_DIR=/path/to/copellism
    ```
3.  **Install Environment:** Initialize the Conda environment:
    ```bash
    bash 0-env.sh
    ```

---

## 2. Dataset and Model Preparation

To train or test the model with our data, please download [Data](https://huggingface.co/datasets/Clorisss/RLBench/tree/main) and [Model](https://huggingface.co/Clorisss/3ds-vla/tree/main) first and ensure your files are placed in the following directories:

### Root Directory (`./`)
* Place `RLBench.zip` here and unzip. This is the training dataset.

### Data Folder (`./3ds-vla/data/`)
* Place `train_json_single.zip` here and unzip. This is the training json folder.

### Pretrain Folder (`./3ds-vla/pretrain/`)
* Place `checkpoint-478000.pth` here.
* Place `llama_model_weights` here.

### GroundingDino Folder (`./3ds-vla/Grounded-Segment-Anything/`)
* Place `sam_vit_h_4b8939.pth` here.
* Place `groundingdino_swint_ogc.pth` here.

### Testing & Experiment Folders
* Place `demos.zip` under `./3ds-vla/` and unzip.
* Place `checkpoint-9.pth` under `./3ds-vla/exp/pretrain1`.

---

## 3. Training

To perform fine-tuning with the provided dataset, run:

```bash
bash 2-finetune.sh
```

---

## 4. Evaluation

To perform evaluation with the provided dataset (demos.zip), run:

```bash
bash 3-TestinSim.sh.
```

However, if you want to collect your own test dataset, use the Line3 command in 3-TestinSim.sh before evaluation the model. The evaluation is build on PerAct Repo.

## 5. Collect your own training dataset
If you want collect your own training dataset in RLbench, run:


```bash
bash 1-collect-data.sh.
```

The pipeline first collects raw data within the RLBench simulator, followed by object mask extraction. Subsequently, it generates the training JSON metadata, and finally generating the point clouds."


## 6. Others

The repo is built on Peract, RLBench, and, Llama-Adapter. Thanks for these amazing work.