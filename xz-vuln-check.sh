$OUTPUT=$(apt list --installed | grep liblzma >2 /dev/null | grep liblzma | cut -d' ' -f2 | cut -d'-' -f1)
echo $OUTPUT

$RESULT=$?

if [ $RESULT -eq 1 ];
then
	echo "Not vulnerable to xz liblzma compromise"
	exit 0
fi

$VERSION = echo $OUTPUT | cut -d' ' -f2 | cut -d'-' -f1

if [ $Result -eq 2 ];
then
	echo "Error"
	exit 1
fi

if [ $VERSION = "5.6.0" -o $VERSION = "5.6.1" ];
then
	echo "vulernable version detected"
else
	echo "VERSION detected is not vulnerable"
fi
