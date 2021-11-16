// ERRCHECK: %compiler %cmp_opt %f -o %output

class A{
    operator func !(input:A):A{input}
    operator func ~(input:A):A{input}
}



func main(): Int64 {
    A() |> !;  // EXPECTED: regex expected expression here
    - ~> !;   // EXPECTED: regex expected expression here

    return 1
}
