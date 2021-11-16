// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface update {
    operator func !(a:This):This
}

extend Int32 <: update{
    operator func !(a:Int32):Int32{
        if (a != 0) {
            return 0
        }
        return 10
    }
}

interface stronger {
    operator func <(a:This,b:This):This
    operator func <=(a:This,b:This):This
    operator func >(a:This,b:This):This
    operator func >=(a:This,b:This):This
    operator func ==(a:This,b:This):This
    operator func !=(a:This,b:This):This
}

extend Array<Int32> <: stronger {
    operator func <(a:Array<Int32>,b:Array<Int32>):Array<Int32>{
        if (a[0] < b[0]) {
            return {a[0]}
        }
        return {b[0]}
    }
    operator func <=(a:Array<Int32>,b:Array<Int32>):Array<Int32>{
        if (a[0] <= b[0]) {
            return {a[0]}
        }
        return {b[0]}
    }
    operator func >(a:Array<Int32>,b:Array<Int32>):Array<Int32>{
        if (a[0] > b[0]) {
            return {a[0]}
        }
        return {b[0]}
    }
    operator func >=(a:Array<Int32>,b:Array<Int32>):Array<Int32>{
        if (a[0] >= b[0]) {
            return {a[0]}
        }
        return {b[0]}
    }

    operator func ==(a:Array<Int32>,b:Array<Int32>):Array<Int32>{
        if (a[0] == b[0]) {
            return {1}
        }
        return {0}
    }
    operator func !=(a:Array<Int32>,b:Array<Int32>):Array<Int32>{
        if (a[0] != b[0]) {
            return {1}
        }
        return {0}
    }
}



func main():Int64{
    var zero : Array<Int32> = {0}
    var one : Array<Int32> = {1}
    var two : Array<Int32> = {2}
    var three : Array<Int32> = {3}
    var n_one : Array<Int32> = {-1}

    var first : Array<Int32>

    first = one > zero < two >= n_one <= three // EXPECTED: regex illegal left value
    if (first[0] != 1) {
        return 5
    }

    var second : Array<Int32>
    second = one == two != three // EXPECTED: regex illegal compare operation

    var test = ((((one > zero) < two) >= n_one) <= three)

    return test[0]
}
