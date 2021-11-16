// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func run<T>() {
 let a :Array<UInt8> = @{1, 2}
 func test() {
     print("called\n")
     a
 }
 test()[0] = 3
 print("${a[0]}\n")
}

func main() {
   run<Int64>()
   run<Int8>()
   0
}