for exp in 'E1' 'E2' 'E3'; do
    python generate/generate_data.py --experiment=$exp --train_samples=2048 --valid_samples=128 --test_samples=128 --log=True --device=cuda:0
done