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

interface R{}

class C <: R{
    var r : Int32
    init(r:Int32){
        this.r = r
    }
}
extend R <: stronger{
    operator func <(a:R,b:R):R{
        if (a.r < b.r) {
            return C(a.r)
        }
        return C(b.r)
    }
    operator func <=(a:R,b:R):R{
        if (a.r <= b.r) {
            return C(a.r)
        }
        return C(b.r)
    }
    operator func >(a:R,b:R):R{
        if (a.r > b.r) {
            return C(a.r)
        }
        return C(b.r)
    }
    operator func >=(a:R,b:R):R{
        if (a.r >= b.r) {
            return C(a.r)
        }
        return C(b.r)
    }

    operator func ==(a:R,b:R):R{
        if (a.r == b.r) {
            return C(1)
        }
        return C(0)
    }
    operator func !=(a:R,b:R):R{
        if (a.r != b.r) {
            return C(1)
        }
        return C(0)
    }
}



func main():Int64{
    var zero : R = C(0)
    var one : R = C(1)
    var two : R = C(2)
    var three : R = C(3)

    var first : R
    first = C(1) > C(0) < C(2) >= C(-1) <= C(3) // EXPECTED: regex illegal compare operation
    if (first.r != 1) {
        return 5
    }

    var second : R
    second = one == two != three // EXPECTED: regex illegal compare operation

    var test = ((((C(1) > C(0)) < C(2)) >= C(-1)) <= C(3))

    return test.r
}
