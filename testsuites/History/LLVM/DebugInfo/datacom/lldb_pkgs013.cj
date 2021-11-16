// DEPENDENCE: ../cjcmd.py ../DatacomTest.py lldb_pkgs013_expected.txt ../packages/pkgs006/src ../packages/pkgs006/cfg-ast
// EXEC: cjc -c -g src/pkgs1/pkg1.cj
// EXEC: cjc -c -g src/pkgs2/pkg2.cj
// EXEC: cjc -c -g src/pkgs1/pkgs101/pkg101.cj
// EXEC: cjc -c -g src/pkgs1/pkgs101/pkgs102/pkg102.cj
// EXEC: cjc -c -g src/pkgs1/pkgs101/pkgs102/pkgs103/pkg103.cj
// EXEC: cjc -c -g src/pkgs1/pkgs101/pkgs102/pkgs103/pkgs104/pkg104.cj
// EXEC: cjc -c -g src/pkgs1/pkgs101/pkgs102/pkgs103/pkgs104/pkgs105/pkg105.cj
// EXEC: cjc -g src/pkgs006.cj pkg1.o pkg2.o pkg101.o pkg102.o pkg103.o pkg104.o pkg105.o
// EXEC: python3 DatacomTest.py lldb_pkgs013_expected.txt