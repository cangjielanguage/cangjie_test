// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A<T>{
    a
    func b(x:T){0}
}


func main(): Int64 {
    var i = A<Int64>.a
    i.b(true) // EXPECTED: regex no matching enum constructor 'b' for given arguments
}
