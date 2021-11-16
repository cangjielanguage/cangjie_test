// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A{
    a(Int64,Int64,Int64)

    func a(){0} // EXPECTED: regex redefinition of declaration 'a'
    func a(x:Int64){0}
}


func main(): Int64 {
    var i = A.a(1,2,3)
    return i.a()
}
