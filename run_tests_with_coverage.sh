PATH=$WORKSPACE/venv/bin:/usr/local/bin:$PATH
if [ ! -d "venv" ]; then
	virtualenv venv
fi

. venv/bin/activate

pip install xmlrunner
pip install pep8
pip install pylint
pip install coverage

set -e
set -x

rm -f pep8.log pylint.log

./test.py

python -m coverage xml -o coverage.xml
python -m coverage html -d coverage

pep8 --max-line-length=120 pystache > pep8.log || true
pylint pystache > pylint.log || true
