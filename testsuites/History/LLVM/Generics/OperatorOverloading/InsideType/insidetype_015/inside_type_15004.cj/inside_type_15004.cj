// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

trait update {
    operator func !(a:This):This
}

append Int32 with update{
    operator func !(a:Int32):Int32{
        if (a != 0) {
            return 0
        }
        return 10
    }
}

trait stronger {
    operator func <(a:This,b:This):This
    operator func <=(a:This,b:This):This
    operator func >(a:This,b:This):This
    operator func >=(a:This,b:This):This
    operator func ==(a:This,b:This):This
    operator func !=(a:This,b:This):This
}

record R<T>{
    var r : Int32
    init(r:Int32){
        this.r = r
    }
}
append R<T> with stronger{
    operator func <(a:R<T>,b:R<T>):R<T>{
        if (a.r < b.r) {
            return R<T>(a.r)
        }
        return R<T>(b.r)
    }
    operator func <=(a:R<T>,b:R<T>):R<T>{
        if (a.r <= b.r) {
            return R<T>(a.r)
        }
        return R<T>(b.r)
    }
    operator func >(a:R<T>,b:R<T>):R<T>{
        if (a.r > b.r) {
            return R<T>(a.r)
        }
        return R<T>(b.r)
    }
    operator func >=(a:R<T>,b:R<T>):R<T>{
        if (a.r >= b.r) {
            return R<T>(a.r)
        }
        return R<T>(b.r)
    }

    operator func ==(a:R<T>,b:R<T>):R<T>{
        if (a.r == b.r) {
            return R<T>(1)
        }
        return R<T>(0)
    }
    operator func !=(a:R<T>,b:R<T>):R<T>{
        if (a.r != b.r) {
            return R<T>(1)
        }
        return R<T>(0)
    }
}

func main():Int64{
    var zero : R<Int32> = R<Int32>(0)
    var one : R<Int32> = R<Int32>(1)
    var two : R<Int32> = R<Int32>(2)
    var three : R<Int32> = R<Int32>(3)

    var first : R<Int32>
    first = R<Int32>(1) > R<Int32>(0) < R<Int32>(2) >= R<Int32>(-1) <= R<Int32>(3) // EXPECT: scan illegal compare operation
    if (first.r != 1) {
        return 5
    }

    var second : R<Int32>
    second = one == two != three // EXPECT: scan illegal compare operation

    var test = ((((R<Int32>(1) > R<Int32>(0)) < R<Int32>(2)) >= R<Int32>(-1)) <= R<Int32>(3))

    return test.r
}
