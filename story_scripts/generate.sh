# Generate
# Note: to load the pretrained model at generation time, 
# you need to pass in a model-override argument to communicate to the fusion model at generation time 
# where you have placed the pretrained checkpoint. 
# By default, it will load the exact path of the fusion model's pretrained model from training time. 
# You should use model-override if you have moved the pretrained model (or are using our provided models). 
# If you are generating from a non-fusion model, the model-override argument is not necessary.

# TODO: CHECK "model-overrides" flag
TEXT="examples/stories/writingPrompts_300"
DATA_DIR="data-bin/writingPrompts_300"
MODEL="TO_BE_FILLED"

fairseq-generate ${DATA_DIR} 
                 --path ${MODEL} 
                 --batch-size 32 
                 --beam 1 
                 --sampling 
                 --sampling-topk 10 
                 --temperature 0.8 
                 --nbest 1 
                 --model-overrides "{'pretrained_checkpoint':'/path/to/pretrained/model/checkpoint'}"

