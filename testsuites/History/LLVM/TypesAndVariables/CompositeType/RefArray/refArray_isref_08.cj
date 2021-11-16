// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func foo(){
	return 1
}
func main() {
    func goo(){
    	return 2
    }
    var arr : RefArray<()->Int64> = RefArray<()->Int64>([foo])
    var b = arr
    b.set(0, goo)
    return b[0]() - 2
}