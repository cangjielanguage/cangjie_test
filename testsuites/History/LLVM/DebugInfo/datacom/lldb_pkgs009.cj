// DEPENDENCE: ../cjcmd.py ../DatacomTest.py lldb_pkgs009_expected.txt ../packages/pkgs004/src ../packages/pkgs004/cfg-ast
// EXEC: cjc -c -g src/pkgs1/pkg1.cj
// EXEC: cjc -c -g src/pkgs2/pkg2.cj
// EXEC: cjc -g pkg1.o pkg2.o src/pkgs004.cj
// EXEC: python3 DatacomTest.py lldb_pkgs009_expected.txt


