// DEPENDENCE: %n.c
// EXEC: %compiler %f -shared %cffi_runtime_opt -o lib%n.so
// EXEC: %clang %cffi_runtime_link %n.c -L. -l%n -o %n
// EXEC: ./%n 2>&1 | compare %f
// ASSERT: scan-not Exception

@c
external func cjFunc(): Unit {
    println("pass")
}
