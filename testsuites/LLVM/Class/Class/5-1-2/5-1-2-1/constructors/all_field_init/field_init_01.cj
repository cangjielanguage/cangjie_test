// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Data {
    var a : Int32 //EXPECTED: regex the uninitialized member variable 'a' is not initialized in the constructor of class or record
    let b : Int32  //EXPECTED: regex the uninitialized member variable 'b' is not initialized in the constructor of class or record

    let b1 : Array<Int32>  //EXPECTED: regex the uninitialized member variable 'b1' is not initialized in the constructor of class or record
    let b2 : List<Int32>[]  //EXPECTED: regex the uninitialized member variable 'b2' is not initialized in the constructor of class or record

    let b3 : Data  //EXPECTED: regex the uninitialized member variable 'b3' is not initialized in the constructor of class or record
}


func run(): Int64 {
    var value : Data = Data();
    return 1
}

func main(): Int64 {
    return run()
}

