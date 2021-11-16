// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

let arrayForSlice = Array<Int64>([0, 1, 2, 3, 4, 5])
func main() {
    let slice1 = arrayForSlice[0..5]
    for (num in slice1) {
    	print(num.toString())
    }
    print("\n")

    let slice2 = arrayForSlice[0..5:1]
    for (num in slice2) {
    	print(num.toString())
    }
    print("\n")

    let slice3 = arrayForSlice[0..5:2]
    for (num in slice3) {
    	print(num.toString())
    }
    print("\n")

    let slice4 = arrayForSlice[5..0:-1]
    for (num in slice4) {
    	print(num.toString())
    }

    print("\n")
    let slice5 = arrayForSlice[5..0:-2]
    for (num in slice5) {
    	print(num.toString())
    }
    print("\n")

    let slice6 = arrayForSlice[0..=5]
    for (num in slice6) {
    	print(num.toString())
    }
	return 0
}