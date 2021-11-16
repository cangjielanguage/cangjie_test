// EXEC: %compiler %cmp_opt %f -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

record Data{
     var a:Int32
     Data(){    // EXPECTED: regex the uninitialized member variable 'a' is not initialized in the constructor of class or record
         if(true){a=1}
     }
}

func getBool(x:Int32):Bool{
    if (x>1) {
        return true
    }else{
        return false
    }
}

record Data2{
    var a: Int32
    Data2(){     // EXPECTED: regex the uninitialized member variable 'a' is not initialized in the constructor of class or record
        if(getBool(2)){a=1}
    }
}

func main():Int64 {
    var data1 = Data()
    var data2 = Data2()
    return 0
}