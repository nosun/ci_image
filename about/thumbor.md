couldnt get it to work. it would simply blow up at the pycurl step. Eventually managed to get it working by installing the missing package, libcurl. 
sudo apt-get install libcurl4-gnutls-dev
then, ran 
pip install thumbor
and it worked!


apt-get install python-dev

apt-get install python-pip

apt-get install ffmpeg libjpeg-dev libpng-dev libtiff-dev libjasper-dev libgtk2.0-dev python-numpy python-pycurl webp python-opencv

pip uninstall PIL

apt-get install libjpeg8-dev

ln -s /usr/lib/x86_64-linux-gnu/libjpeg.so /usr/lib

pip install pillow
pip install thumbor