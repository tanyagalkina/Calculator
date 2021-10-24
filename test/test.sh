#!/bin/bash

./funEvalExpr "2 + 4" > test/output.tester
./funEvalExpr "42. 222 + 5" >> test/output.tester
./funEvalExpr "(  2 + 0. 88) / 2" >> test/output.tester
./funEvalExpr "9 * 3" >> test/output.tester
./funEvalExpr "8 / 2" >> test/output.tester
./funEvalExpr "4 - 2.8" >> test/output.tester
./funEvalExpr "2 / 0" >> test/output.tester
./funEvalExpr "  " >> test/output.tester
./funEvalExpr >> test/output.tester
./funEvalExpr "jlsskdd" >> test/output.tester

file1="test/output.test"
file2="test/output.tester"


tput bold

if cmp -s "$file1" "$file2"; then
    tput setaf 2;
    printf 'The file "%s" is the same as "%s"\n' "$file1" "$file2"
else
    tput setaf 1;
    printf 'The file "%s" is different from "%s"\n' "$file1" "$file2"
    tput setaf 3
    diff "$file1" "$file2"
fi

tput sgr0