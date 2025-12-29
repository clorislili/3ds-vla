# export COPPELIASIM_ROOT=../CoppeliaSim_Edu_V4_1_0_Ubuntu20_04
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$COPPELIASIM_ROOT
# export QT_QPA_PLATFORM_PLUGIN_PATH=$COPPELIASIM_ROOT

#--root_path is set in ./3ds-vla/RLBench/tools/dataset_generator_train
xvfb-run -a python ./3ds-vla/RLBench/tools/dataset_generator_train.py #1. collect data in RLBench. Modify the config in RLBench/tools/dataset_generator.py. The repo is modified by authors, and is not identical with the original RLBench repo
bash ./Grounded-Segment-Anything/grounded_sam_1.sh #2. generate the mask for each episode
bash ./Grounded-Segment-Anything/grounded_sam_2.sh #2. generate the target mask for each episode
python ./3ds-vla/data/get_dataset_touch2d_box_target_3dpoint_moretasks.py --root_path ./RLBench/train_dataset --output_path ./3ds-vla/data/train_json_1225 #3. generate train json
python ./3ds-vla/data/generate_pc.py --data_dir ./3ds-vla/data/train_json_1225 #3. generate the point cloud #4. generage point cloud
