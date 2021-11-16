// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A{
    a
    func a(x:Int64){} // EXPECTED: regex redefinition of declaration 'a'
}


func main(): Int64 {
    var i = A.a
    i.a(1)
    return 0
}
