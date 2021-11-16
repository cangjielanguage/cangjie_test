// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface update<T> {
    operator func !(): T
}

extend Int32 <: update<Int32>{
}

interface stronger<T> {
    operator func [](b:T): T
    // operator func !(): T
    operator func -(): T
    operator func **(b: T): T
    operator func *(b: T): T
    operator func /(b: T): T
    operator func %(b: T): T
    operator func +(b: T): T
    operator func -(b: T): T
    operator func <<(b: T): T
    operator func >>(b: T): T
    operator func <(b: T): T
    operator func <=(b: T): T
    operator func >(b: T): T
    operator func >=(b: T): T
    operator func ==(b: T): T
    operator func !=(b: T): T
    operator func &(b: T): T
    operator func ^(b: T): T
    operator func |(b: T): T
//     operator func ^^(b: T): T
}


record R{
    var r : Int32
}

extend R <: update<R> {
    operator func !():R{
        return R(r:!( this.r))
    }
}
extend R <: stronger<R> {
    operator func [](b:R):R{
        return R(r:-2)
    }

    operator func -():R{
        return R(r:-( this.r))
    }

    operator func **(b:R):R{
        var res : Int32 = 1
        var temp : Int32 = b.r
        while (temp > 0) {
            res = res *  this.r
            temp = temp - 1
        }
        return R(r:res)
    }

    operator func *(b:R):R{
        return R(r:( this.r)*(b.r))
    }
    operator func /(b:R):R{
        return R(r:( this.r)/(b.r))
    }
    operator func %(b:R):R{
        return R(r:( this.r)%(b.r))
    }

    operator func +(b:R):R{
        return R(r:( this.r)+(b.r))
    }
    operator func -(b:R):R{
       return R(r:( this.r)-(b.r))
    }

    operator func <<(b:R):R{
        return R(r:( this.r)<<(b.r))
    }
    operator func >>(b:R):R{
        return R(r:( this.r)>>(b.r))
    }

    operator func <(b:R):R{
        if ( this.r < b.r) {
            return R(r: this.r)
        }
        return R(r:b.r)
    }
    operator func <=(b:R):R{
        if ( this.r <= b.r) {
            return R(r: this.r)
        }
        return R(r:b.r)
    }
    operator func >(b:R):R{
        if ( this.r > b.r) {
            return R(r: this.r)
        }
        return R(r:b.r)
    }
    operator func >=(b:R):R{
        if ( this.r >= b.r) {
            return R(r: this.r)
        }
        return R(r:b.r)
    }

    operator func ==(b:R):R{
        if ( this.r == b.r) {
            return R(r:1)
        }
        return R(r:0)
    }
    operator func !=(b:R):R{
        if ( this.r != b.r) {
            return R(r:1)
        }
        return R(r:0)
    }

    operator func &(b:R):R{
        return R(r:( this.r)&(b.r))
    }

    operator func ^(b:R):R{
        return R(r:( this.r)^(b.r))
    }

    operator func |(b:R):R{
        return R(r:( this.r)|(b.r))
    }


}



func main():Int64{
    var zero : R = R(r:0)
    var one : R = R(r:1)
    var two : R = R(r:2)
    var three : R = R(r:3)
    var res : R = R(r:8192)
    var a : R = zero > one << one + three * two ** -zero[zero]
    var final : R =  three ^ one & res == zero > one << one + three * two ** -zero[zero]
    // 1. zero[zero] = R(-2)
    // 2. two ** -zero[zero] = R(4)
    // 3. one + three * two ** -zero[zero] = R(13)
    // 4. one << R(13) = res
    // 5. zero > R(13) = res
    // 6. res == res = one , if 1-5 got any error, 5`s result will be zero.
    // 7. one & one = one , one & zero = zero. So we choose one here.
    // 8. three ^ one = two , one ^ zero = three. So we choose three here.
    // 9. two | two = two , two | three = three. So we choose two here.
    // 10. zero ^^ two = R(123), so final.r = 123
    if (final.r != 2) {
        return 1
    }

    var first : R
    first = !-R(r:1) //  first.r == 10
    if (first.r != 0) {
        return 2
    }

    var second : R
    second = R(r:2) * R(r:4) % R(r:5) / R(r:2)
    if (second.r != 1) {
        return 3
    }

    var third : R
    third = R(r:-1) + R(r:5)  - R(r:-2)
    if (third.r != 6) {
        return 4
    }

    var fourth : R
    fourth = R(r:1) << R(r:3) >> R(r:2)
    if (fourth.r != 2) {
        return 5
    }

    return 0
}
