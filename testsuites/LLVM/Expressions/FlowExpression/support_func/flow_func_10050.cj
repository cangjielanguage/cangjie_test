// ERRCHECK: %compiler %cmp_opt %f -o %output

class A<T>{
    static operator func ()(input:T):T{input} // EXPECTED: regex modifiers 'static' and 'operator' are conflict in function declaration
    static operator func ()(input:(T)->T):Unit{} // EXPECTED: regex modifiers 'static' and 'operator' are conflict in function declaration
}

func main(): Int64 {
    1 |> A<Int64> // EXPECTED: regex expected member name or constructor call after 'A' type name
    A<Int64>~>A<Int64> // EXPECTED: regex expected member name or constructor call after 'A' type name
    return 1
}
