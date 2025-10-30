
uv init \
  --name <PROJECT_NAME> \
  --package \                # src/ layout + buildable package
  --lib \                    # library-style project
  --author-from git \        # infer author from your git config
  --build-backend hatch      # use hatch's build backend

uv tool install ruff pytest ty

uv add "numpy<2" pandas scikit-learn tqdm matplotlib einops \
       ipykernel transformers datasets

uv add "torch==2.2.2"
uv sync --extra cpu
