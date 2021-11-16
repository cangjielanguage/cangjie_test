// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

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

record R<T>{
    var r : Int32
    operator func [](a:R<T>,b:R<T>):R<T>{
        return R<T>(-2)
    }

    operator func ~(a:R<T>):R<T>{
        return R<T>(~(a.r))
    }
    operator func !(a:R<T>):R<T>{
        return R<T>(!(a.r))
    }
    operator func +(a:R<T>):R<T>{
        return R<T>(+(a.r))
    }
    operator func -(a:R<T>):R<T>{
        return R<T>(-(a.r))
    }

// operator ** is illegal
        var res : Int32 = 1
        var temp : Int32 = b.r
        while (temp > 0) {
            res = res * a.r
            temp = temp - 1
        }
        return R<T>(res)
    }

    operator func *(a:R<T>,b:R<T>):R<T>{
        return R<T>((a.r)*(b.r))
    }
    operator func /(a:R<T>,b:R<T>):R<T>{
        return R<T>((a.r)/(b.r))
    }
    operator func %(a:R<T>,b:R<T>):R<T>{
        return R<T>((a.r)%(b.r))
    }
// operator *& is illegal
        // return R<T>((a.r)*&(b.r))
        return R<T>((a.r)*(b.r))
    }

// operator +& is illegal
        // return R<T>((a.r)+&(b.r))
        return R<T>((a.r)+(b.r))
    }
// operator -& is illegal
       // return R<T>((a.r)-&(b.r))
       return R<T>((a.r)-(b.r))
    }
    operator func +(a:R<T>,b:R<T>):R<T>{
        return R<T>((a.r)+(b.r))
    }
    operator func -(a:R<T>,b:R<T>):R<T>{
       return R<T>((a.r)-(b.r))
    }

    operator func <<(a:R<T>,b:R<T>):R<T>{
        return R<T>((a.r)<<(b.r))
    }
    operator func >>(a:R<T>,b:R<T>):R<T>{
        return R<T>((a.r)>>(b.r))
    }

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

    operator func &(a:R<T>,b:R<T>):R<T>{
        return R<T>((a.r)&(b.r))
    }

    operator func ^(a:R<T>,b:R<T>):R<T>{
        return R<T>((a.r)^(b.r))
    }

    operator func |(a:R<T>,b:R<T>):R<T>{
        return R<T>((a.r)|(b.r))
    }

    operator func ^^(a:R<T>,b:R<T>):R<T>{
        if (b.r == 2) {
            return R<T>(123)
        }
        if (b.r == 3) {
            return R<T>(321)
        }
        return R<T>(0)
    }
}

func main():Int64{
    var zero : R<Int32> = R<Int32>(0)
    var one : R<Int32> = R<Int32>(1)
    var two : R<Int32> = R<Int32>(2)
    var three : R<Int32> = R<Int32>(3)
    var res : R<Int32> = R<Int32>(8192)
    var a : R<Int32> = zero > one << one + three * two ** -zero[zero]
    var final : R<Int32> = zero ^^ two | three ^ one & res == zero > one << one + three * two ** -zero[zero]
    // 1. zero[zero] = R<T>(-2)
    // 2. two ** -zero[zero] = R<T>(4)
    // 3. one + three * two ** -zero[zero] = R<T>(13)
    // 4. one << R<T>(13) = res
    // 5. zero > R<T>(13) = res
    // 6. res == res = one , if 1-5 got any error, 5`s result will be zero.
    // 7. one & one = one , one & zero = zero. So we choose one here.
    // 8. three ^ one = two , one ^ zero = three. So we choose three here.
    // 9. two | two = two , two | three = three. So we choose two here.
    // 10. zero ^^ two = R<T>(123), so final.r = 123
    if (final.r != 123) {
        return 1
    }

    var first : R<Int32>
    first = !~-+R<Int32>(1) //  first.r == 10
    if (first.r != 10) {
        return 2
    }

    var second : R<Int32>
    second = R<Int32>(2) * R<Int32>(4) % R<Int32>(5) / R<Int32>(2) *& R<Int32>(3)
    if (second.r != 3) {
        return 3
    }

    var third : R<Int32>
    third = R<Int32>(-1) + R<Int32>(5) +& R<Int32>(-3) -& R<Int32>(2) - R<Int32>(-2)
    if (third.r != 1) {
        return 4
    }

    var fourth : R<Int32>
    fourth = R<Int32>(1) << R<Int32>(3) >> R<Int32>(2)
    if (fourth.r != 2) {
        return 5
    }

    return 0
}
