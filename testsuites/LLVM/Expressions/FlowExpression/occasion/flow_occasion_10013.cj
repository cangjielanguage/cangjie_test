// ERRCHECK: %compiler %cmp_opt %f -o %output

func a(input:Bool):Bool{input}

extend Bool {
    operator func ()(input_b:Bool):Bool { input }
}

func main(): Int64 {
    (true|>a) || (true|>a)
    (true~>true) || (true~>true) // EXPECTED: regex invalid binary operator '||'
    return 0
}
