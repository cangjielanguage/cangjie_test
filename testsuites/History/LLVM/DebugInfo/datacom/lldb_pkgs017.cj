// DEPENDENCE: ../cjcmd.py ../DatacomTest.py lldb_pkgs017_expected.txt ../packages/pkgs007/src ../packages/pkgs007/cfg-ast
// EXEC: cjc -c -g src/module007/src/pkgs/pkgs.cj -module-name module007
// EXEC: cjc -g  src/pkgs007.cj -import-config cfg-ast pkgs.o
// EXEC: python3 DatacomTest.py lldb_pkgs017_expected.txt

