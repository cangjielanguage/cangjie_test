// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A{
    a
    static func a(x:Int64){0} // EXPECTED: regex redefinition of declaration 'a'
}


func main(): Int64 {
    A.a(0)
}
