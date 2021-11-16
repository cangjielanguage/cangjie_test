// EXEC: %compiler %cmp_opt %f -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

class Data{
    let rge = 0..5
    var a: Int64
    init(x:Int32){      // EXPECTED: regex the uninitialized member variable 'a' is not initialized in the constructor of class or record
        for (i in rge) {
            a = i
        }
    }
}

func main():Int64 {
    var data1 = Data(90)
    if (data1.a == 8) {
        return 0
    }
    return 1
}