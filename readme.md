# Docker Torch7

building torch 7 on top of cuda for GPU support this is meant for prototyping and development. You can limit resources through the docker or leave them un-defined to give full access to your local machine.

## Install
Assuming you have docker installed. Add this to your bash rc. To ensure you have a consistent working environment, you will want to pin latest to a specific working version.
```sh
NOTEBOOK_DIR=${NOTEBOOK_DIR:=$HOME/notebook}
alias th='docker run -v $NOTEBOOK_DIR:/notebook:latest -p 8080:8080 --rm -i sammerry/torch'
```

## Running The Repl
The repl available is for lua. PyTorch is available through jupyter. You can then run tensorflow repl with the `th` command for quick prototyping. Optionally you can run `cat somelocal_luafile.lua | th' to see the line by line evaluation in the torch repl.

You can also run one of the torch examples from the torch examles repo. Or any other file inside the docker environment with the following.
```
th /demos/profiling/conv-cpu.lua
```

If you need to run a local file you can cat it into the docker environment using the | or < bash operators.
```sh
cat << EOF | th
a = torch.rand(100,100)
b = torch.rand(50,50)
torch.conv2(a,b)
EOF
```

## Jupyter
We start Jupyter in the background. You can access it on port 8080 from your local host in the browser of your choice.
