// ERRCHECK: %compiler %cmp_opt %f -o %output

func main() {
    throw X() // EXPECTED: regex undeclared identifier 'X'
    return 0
}
