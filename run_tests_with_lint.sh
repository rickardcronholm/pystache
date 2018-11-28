PATH=$WORKSPACE/venv/bin:/usr/local/bin:$PATH
if [ ! -d "venv" ]; then
	virtualenv venv
fi

. venv/bin/activate

pip install xmlrunner
pip install pep8
pip install pyflakes

set -e
set -x

rm -f pep8.log pyflakes.log

./test.py

pep8 --max-line-length=120 pystache > pep8.log || true
pyflakes pystache > pyflakes.log || true
