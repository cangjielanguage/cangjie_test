// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success!

var x = 0

class A <: Resource {
    func isClosed(){x++;true}
    func close(){throw Exception()}
}



func main() {
    try(a : A = try(a : A = try(a : A = try(a : A = try(a : A = try(a : A = try(a : A = try(a : A = try(a : A = try(a : A = try(a : A = A()){A()}){A()}){A()}){A()}){A()}){A()}){A()}){A()}){A()}){A()}){}
    print("success!\n")
    return x-10
}
