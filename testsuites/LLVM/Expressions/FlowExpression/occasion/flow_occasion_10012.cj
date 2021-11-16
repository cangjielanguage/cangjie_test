// ERRCHECK: %compiler %cmp_opt %f -o %output

func a(input:Bool):Bool{input}

extend Bool {
    operator func ()(input_b:Bool):Bool { input_b }
}

func main(): Int64 {
    (true|>a) && (true|>a)
    (true~>true) && (true~>true) // EXPECTED: regex invalid binary operator '&&' on type '\(Bool\) -> Bool' and '\(Bool\) -> Bool'
    return 0
}
