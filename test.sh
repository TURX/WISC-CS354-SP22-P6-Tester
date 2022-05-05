#!/usr/bin/env bash

# CS354 SP22 Project 6 Sample Tester
# Authored by Ruixuan Tu

echo "CS354 SP22 Project 6 Sample Tester"
echo "Authored by Ruixuan Tu"
echo "---------------------------------"

UNAME_S=$(uname -s)
export readonly UNAME_S
if [ "$UNAME_S" == "Darwin" ]
then
  MY_CC=clang
  export readonly MY_CC
else
  MY_CC=gcc
  export readonly MY_CC
fi
echo "[Environment]"
echo OS: "$UNAME_S"
echo Compiler: "$MY_CC"
echo "---------------------------------"

echo "[Execution]"
echo "#include \"cache_test.h\"" > cache_test.c
cat cache.c | perl -pe 'BEGIN{undef $/;} s/\/\/ THE CACHE\n(.*\n)+char system_bus\[32\];//sgm and s/int main\(\) {\n(.*\n)+}//sgm' >> cache_test.c
"$MY_CC" -g driver_test.c cache_test.c -o driver.exe -Wall
rm -rf test_output
mkdir test_output
for f in test_input/*.txt
do
  [[ -e "$f" ]] || break
  filename=$(basename "$f")
  filenameWithoutExt="${filename%.*}"
  echo "Running $filenameWithoutExt"
  args="$(cat "$f")"
  echo "./driver.exe $args > test_output/$filename"
  # shellcheck disable=SC2086
  ./driver.exe $args > test_output/$filename
done
rm -rf cache_test.c driver.exe driver.exe.dSYM
echo "---------------------------------"

echo "[Check]"
for f in expected_output/*.txt
do
  [[ -e "$f" ]] || break
  filename=$(basename "$f")
  filenameWithoutExt="${filename%.*}"
  echo "Checking $filenameWithoutExt"
  python3 judger.py "$f" test_output/"$filename"
done
echo "---------------------------------"

echo "Finished"
