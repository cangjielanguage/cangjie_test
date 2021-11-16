// ERRCHECK: %compiler %cmp_opt %f -o %output


extend Bool {
    operator func ()(b:Bool):Int64{1}
}

func main(): Int64 {
    true(1) // EXPECTED: regex calling object is not a function or constructors
    return 0
}
