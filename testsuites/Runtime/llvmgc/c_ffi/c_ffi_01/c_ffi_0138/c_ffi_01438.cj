// DEPENDENCE: %n.c a b
// EXEC: %compiler a/a.cj -shared %cffi_runtime_opt -o liba.so
// EXEC: %compiler b/b.cj -shared %cffi_runtime_opt -o libb.so
// EXEC: %clang %cffi_runtime_link %n.c -L. -la -lb -o %n
// EXEC: ./%n 2>&1 | compare %f
// ASSERT: scan from a
// ASSERT: scan-not from b

