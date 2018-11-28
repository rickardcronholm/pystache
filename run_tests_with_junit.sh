PATH=$WORKSPACE/venv/bin:/usr/local/bin:$PATH
if [ ! -d "venv" ]; then
	virtualenv venv
fi

. venv/bin/activate

./test.py
