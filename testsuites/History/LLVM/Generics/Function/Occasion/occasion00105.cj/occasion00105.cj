// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASEERT: regex-not core dump
// ASEERT: regex-not stack trace

trait update{
    func foo<T>(a:This,b:T):This // EXPECTED: regex trait function cannot define generic parameters
}

class A{}

append A with update{
    func foo<T>(a:A,b:T):A{return a}
}

func main(){
    foo<A>(A(),A())
    return 0
}
