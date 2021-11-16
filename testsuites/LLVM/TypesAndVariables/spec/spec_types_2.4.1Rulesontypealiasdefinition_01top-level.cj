// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func test() {
    type Point2D = Float64*Float64  // EXPECTED: regex type must be declared on toplevel
    type Point3D = Float64*Float64*Float64  // EXPECTED: regex type must be declared on toplevel
}


func main(){
    test()
    return 0
}

