export LD_LIBRARY_PATH=/usr/local/paddle_inference/third_party/install/paddle2onnx/lib${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export LD_LIBRARY_PATH=/usr/local/paddle_inference/third_party/install/onnxruntime/lib:${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export LD_LIBRARY_PATH=/usr/local/paddle_inference/third_party/install/mkldnn/lib:${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export LD_LIBRARY_PATH=/home/t/polarstar/DL/Paddle3D/deploy/iassd/cpp/build:${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

./build/main --model_file /home/t/polarstar/DL/Paddle3D/outputs/iassd_kitti_v1/iassd.pdmodel --params_file /home/t/polarstar/DL/Paddle3D/outputs/iassd_kitti_v1/iassd.pdiparams  --lidar_file /data/polarstar/kitti/training/velodyne/000001.bin --gpu_id 1
