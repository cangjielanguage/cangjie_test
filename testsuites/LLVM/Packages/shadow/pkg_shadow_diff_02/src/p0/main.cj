// DEPENDENCE: ../p1 ../p2
// EXEC: %compiler %cmp_opt -c ./p1/*.cj -o p1.%middle
// EXEC: %compiler %cmp_opt -c ./p2/*.cj -o p2.%middle
// EXEC-PIPE-1: %compiler %cmp_opt p1.%middle p2.%middle %f -o %output 2>&1 | compare %f

//DTS202107120HDZX5P1F00
package p0
import p1.foo // EXPECTED: regex-not error
import p2.foo // EXPECTED: regex-not error

func main(): Int64 {
    var a1 = foo() // EXPECTED: regex erro.*there occurs type ambiguity about func_decl class_decl on imported declaration 'foo'
    var a2 = p2.foo()
    var a3 = p1.foo()
    return 0
}
