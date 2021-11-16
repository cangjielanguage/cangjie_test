// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

package p
    var A = 0  // conflict with A
    var F: (Int64)->Int64 = { i => i }  // conflict with F
enum E {
    | A  // conflict with A
    | F(Int64) // conflict with F
}
enum R {
    | C(Int64)  // conflict with C
}
enum C {  // conflict with C
    | B
}
func g() {
    let a = A  // EXPECTED: regex enum sugar access 'A' conflict with variable name, try to use with prefix
    let b = E.A  // ok
    let c = p.A  // ok
    F(1)  // EXPECTED: regex enum sugar access 'F' conflict with variable name, try to use with prefix
    E.F(1) // ok
//    p.F(1) // ok
    let x: C  // error
    let y: p.C  
}
func main(){
    var A = 0  // conflict with A
    var F: (Int64)->Int64 = { i => i }  // conflict with F
    g()   
    return 0
}

