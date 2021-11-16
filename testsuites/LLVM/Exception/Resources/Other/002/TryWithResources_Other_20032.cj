// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan try_expr is illegal before this increment or decrement expression

class A <: Resource {
    func isClosed(){print("A!");true}
    func close(){}
}

func main() {
    var i = 1
    try(a : A = A()){i}--
    print("success!\n")
    return 0
}
