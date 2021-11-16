// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex StringTest: Hog

var str = "Hello Char Lang"
var i1: Int64 = 0
var i2: Int64 = 4
var s1: Char = str.charAt(i1)
var s2: Char = str.charAt(i2)
var s3: Char = str.charAt(14)

func run(): Int64 {

    print("StringTest: " + s1.toString() + s2.toString() + s3.toString())
    return 0
}

func main(): Int64 {
    return run()
}
