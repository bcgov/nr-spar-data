#!/bin/bash
set -euxo nounset


### Prerequisites

# pyenv - https://github.com/pyenv/pyenv#installation
# pg_conf - sudo dnf -y install libpq-devel


### Setup

# Several packages are not working for python 3.12
PYVER=3.10

export COMMAND=${1:-}
if [ "${COMMAND}" == "local" ]; then
  [ -z "${PYENV_ROOT}" ]|| export PYENV_ROOT="$HOME/.pyenv"
  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  pyenv update
  pyenv install -s ${PYVER}
  pyenv global ${PYVER}
  python -m venv --clear venv
  source venv/bin/activate
  python -m pip install --upgrade pip
fi


### Requirements

python -m pip install -r ./requirements.txt --cache-dir ./data


### Run

cd src
python main.py
