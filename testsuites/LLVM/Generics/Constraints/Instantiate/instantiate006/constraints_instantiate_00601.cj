// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A{}

interface B<X,Y,Z> where X<:A,X<:A,X<:A,
Y<:A,Y<:A,Y<:A,
Z<:A,Z<:A,Z<:A{}


func main():Int64{
    func test(a:B<A,A,A>){}
    return 0
}
