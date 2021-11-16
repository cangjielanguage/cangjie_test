// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A <: Resource {
    func isClosed(){true}
    func close(){throw Exception()}
}

func main() {
    return try(a : A = A()){0}
}
