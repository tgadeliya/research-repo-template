# research-repo-template

Step-by-step research project repo setup using modern tools and custom pyproject configs 

Template for research-projects focused on implementation and replication of the modern AI papers

# .env

```bash
OPENAI_API_KEY=your-api-key
ANTHROPIC_API_KEY=your-api-key
GOOGLE_API_KEY=your-api-key
```

# Initial repo setup

### 1) Create a package-style project, pin Python, init git, and scaffold files
```
uv init \
  --name <PROJECT_NAME> \
  --package \                # src/ layout + buildable package
  --lib \                    # library-style project
  --author-from git \        # infer author from your git config
  --build-backend hatch      # use hatch's build backend

```

### 2) Dev tooling (ruff, pytest, type checker) using dependency groups

```
uv tool install ruff pytest
uv tool install ty
```

### 3) Add core runtime deps (HF + scientific stack)
```
uv add "numpy<2" pandas scikit-learn tqdm matplotlib einops \
       ipykernel transformers datasets
```
### 4.0) PyTorch installation

Add to `pyproject.toml` before installation
```
[tool.uv.sources]
torch = [
  { index = "pytorch-cpu" },
]
torchvision = [
  { index = "pytorch-cpu" },
]

[[tool.uv.index]]
name = "pytorch-cpu"
url = "https://download.pytorch.org/whl/cpu"
explicit = true
```

For old Macbooks with Intel processors, the latest possible version is "2.2.2":
```
uv add "torch==2.2.2"
```

### 4.1) (Optional) Wire PyTorch via extras (CPU/GPU) – see pyproject below
After saving pyproject.toml, sync with either:
```
  uv sync --extra cpu
  uv sync --extra gpu
```


# Configuration of tools (add to `pyproject.toml`)

```
[tool.ruff]
line-length = 80

[tool.ruff.lint]
preview = true
select = [
    "E",
    "F",
    "I",
    "UP"
]
extend-select = [
    "E501",
    "UP045"
]
ignore = [
    "E702"
]

```
