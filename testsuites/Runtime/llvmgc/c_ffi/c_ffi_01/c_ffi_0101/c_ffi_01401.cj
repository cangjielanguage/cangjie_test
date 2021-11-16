// DEPENDENCE: %n.c
// EXEC: %compiler %f -shared %cffi_runtime_opt -o lib%n.so
// EXEC: %clang %cffi_runtime_link %n.c -L. -l%n -o %n
// EXEC: ./%n 2>&1 | compare %f 
// ASSERT: scan pass1
// ASSERT: scan pass2

var a: Int8 = 1
var b: Int8 = 2

@c
external func aPlusB(): Unit {
    a += b 
}

@c
external func printResult(): Unit {
    if (a == 3) {
        println("pass1")
    }
}
