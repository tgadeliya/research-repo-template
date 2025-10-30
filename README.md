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

> **Explanation (annotated — not for copy/paste)**
>
> ```bash
> uv init \
>   --name <PROJECT_NAME> \      # change to your project name
>   --package \                  # use src/ layout and buildable package
>   --lib \                      # library-style project
>   --author-from git \          # infer author from your git config
>   --build-backend hatch        # use Hatch as the build backend
> ```
>
> Replace `<PROJECT_NAME>` with your desired package name.

**Copy-paste command:**

```bash
uv init --name <PROJECT_NAME> --package --lib --author-from git --build-backend hatch
```

### 2) Dev tooling (ruff, pytest, type checker) using dependency groups

```
uv add --dev ruff;
uv add --dev pytest;
uv add --dev ty
```

### 3) Add core runtime deps

#### 3.1) HF + scientific stack
```
uv add "numpy<2" pandas scikit-learn tqdm matplotlib einops \
       ipykernel transformers datasets
```

#### 3.2) API-based LLM
```bash
uv add openai tiktoken
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
line-length = 88

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
