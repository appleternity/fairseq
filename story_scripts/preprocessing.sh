# Binarize the dataset
TEXT="examples/stories/writingPrompts_300"
DATA_DIR="data-bin/writingPrompts_300"

fairseq-preprocess --source-lang wp_source --target-lang wp_target \
    --trainpref $TEXT/train --validpref $TEXT/valid --testpref $TEXT/test \
    --destdir ${DATA_DIR} --padding-factor 1 --thresholdtgt 10 --thresholdsrc 10
