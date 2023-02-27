export LD_LIBRARY_PATH=/usr/local/paddle_inference/third_party/install/paddle2onnx/lib${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export LD_LIBRARY_PATH=/usr/local/paddle_inference/third_party/install/onnxruntime/lib:${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export LD_LIBRARY_PATH=/usr/local/paddle_inference/third_party/install/mkldnn/lib:${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export LD_LIBRARY_PATH=/usr/local/tensorrt/lib:${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
# export LD_LIBRARY_PATH=/home/t/polarstar/DL/Paddle3D/deploy/centerpoint/cpp/build:${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

MODEL_DIR=/home/t/polarstar/DL/Paddle3D/offical_model/centerpoint/centerpoint_pillars_016voxel_kitti/centerpoint
POINT_CLOUD=/data/polarstar/kitti/training/velodyne/000002.bin

#直接运行
./build/main --model_file ${MODEL_DIR}.pdmodel --params_file ${MODEL_DIR}.pdiparams  --lidar_file ${POINT_CLOUD} --gpu_id 1

# # 首次运行TensorRT，收集模型动态shape信息，并保存至--dynamic_shape_file指定的文件中
# ./build/main --model_file ${MODEL_DIR}.pdmodel --params_file ${MODEL_DIR}.pdiparams  --lidar_file ${POINT_CLOUD} --num_point_dim 4 --use_trt 1 --collect_shape_info 1 --dynamic_shape_file ${MODEL_DIR}_shape_info.txt

# #加载--dynamic_shape_file指定的模型动态shape信息，使用FP32精度进行预测
# ./build/main --model_file ${MODEL_DIR}.pdmodel --params_file ${MODEL_DIR}.pdiparams  --lidar_file ${POINT_CLOUD} --num_point_dim 4 --use_trt 1 --dynamic_shape_file ${MODEL_DIR}_shape_info.txt

# #加载--dynamic_shape_file指定的模型动态shape信息，使用FP16精度进行预测
# ./build/main --model_file ${MODEL_DIR}.pdmodel --params_file ${MODEL_DIR}.pdiparams  --lidar_file ${POINT_CLOUD} --num_point_dim 4 --use_trt 1 --dynamic_shape_file ${MODEL_DIR}_shape_info.txt --trt_precision 1

# #如果觉得每次运行时模型加载的时间过长，可以设置trt_use_static和trt_static_dir，首次运行时将TensorRT的优化信息保存在硬盘中，后续直接反序列化优化信息即可
# ./build/main --model_file ${MODEL_DIR}.pdmodel --params_file ${MODEL_DIR}.pdiparams  --lidar_file ${POINT_CLOUD} --num_point_dim 4 --use_trt 1 --dynamic_shape_file ${MODEL_DIR}_shape_info.txt --trt_precision 1 --trt_use_static 1 --trt_static_dir ${MODEL_DIR}
