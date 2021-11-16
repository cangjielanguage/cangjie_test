// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

var aa = 0

func main():Int64{
    var b = C().f2(2)
    if (b is C && aa == 1 && b.a == 6) {
        return 0
    }
    return 1
}

open class Data{
    Data(var a!: Int64 = 6){
        aa++
    }

    open func f2(a: Int64): This{ 
        aa = aa + 5
        return this
    }
}

class C <: Data{
    override func f2(a: Int64): Data{ // EXPECTED: regex return type of 'f2' is not identical or not a subtype of the overridden/redefined function
        return this
    }
}