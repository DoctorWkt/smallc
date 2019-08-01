#! /bin/sh

gcc -m32 -w -o smallc smallc.c || exit 1

gcc -DSMALLC -E -P -o smallc.i smallc.c || exit 1

./smallc <<END || exit 1


smallc.i
smallc.s
END

gcc -m32 -o smallc2 smallc.s || exit 1

./smallc2 <<END || exit 1


smallc.i
smallc2.s
END

diff -q smallc.s smallc2.s || exit 1

echo "Success!"
exit 0
