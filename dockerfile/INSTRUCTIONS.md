```
cd dockerfile
docker build -t alextongdo/openrlhf:v0.0.1 -f Dockerfile.dev .
bash ./launch_docker.sh
```

Once you're in the Docker container.
```
cd dockerfile
bash ./extra_setup_in_docker.sh
cd ..
```

A quick test with SFT and 125m model.
```
deepspeed --module openrlhf.cli.train_sft \
   --max_len 512 \
   --dataset Open-Orca/OpenOrca \
   --input_key question \
   --output_key response \
   --train_batch_size 16 \
   --micro_train_batch_size 4 \
   --max_samples 100 \
   --pretrain facebook/opt-125m \
   --save_path ./test_sft_output \
   --zero_stage 2 \
   --max_epochs 1 \
   --bf16 \
   --flash_attn \
   --learning_rate 5e-5 \
   --packing_samples
```