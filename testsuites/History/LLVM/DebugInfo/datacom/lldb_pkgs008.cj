// DEPENDENCE: ../cjcmd.py ../DatacomTest.py lldb_pkgs008_expected.txt ../packages/pkgs003/src ../packages/pkgs003/cfg-ast
// EXEC: cjc -c -g src/pkgs1/pkg1.cj
// EXEC: cjc -c -g src/pkgs2/pkg2.cj
// EXEC: cjc -g pkg1.o pkg2.o src/pkgs003.cj
// EXEC: python3 DatacomTest.py lldb_pkgs008_expected.txt


