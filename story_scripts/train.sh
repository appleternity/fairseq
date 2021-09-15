# Train GCNN model
TEXT="examples/stories/writingPrompts_300"
DATA_DIR="data-bin/writingPrompts_300"

CUDA_VISIBLE_DEVICES="" fairseq-train ${DATA_DIR} \
              -a fconv_self_att_wp \
              --lr 0.25 \
              --optimizer nag \
              --clip-norm 0.1 \
              --max-tokens 500 \
              --lr-scheduler reduce_lr_on_plateau \
              --decoder-attention True \
              --encoder-attention False \
              --criterion label_smoothed_cross_entropy \
              --weight-decay .0000001 \
              --label-smoothing 0 \
              --source-lang wp_source \
              --target-lang wp_target \
              --gated-attention True \
              --self-attention True \
              --project-input True \
              --pretrained False

