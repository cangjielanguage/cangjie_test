// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64{
    func multiValues(a: Int32, b: Int32) {((a,b),(a + b, a - b))}
    var (x, y) = multiValues(8,24) 
    print(x[0].toString()+"\n")
    print(x[1].toString()+"\n")
    print(y[0].toString()+"\n")
    print(y[1].toString()+"\n")
    if (x[0] == 8 && x[1] == 24 && y[0]==32 && y[1] == -16) {
        return 0
    }
    return 1
}