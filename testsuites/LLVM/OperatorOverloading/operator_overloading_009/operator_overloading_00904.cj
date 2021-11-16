// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface update<T> {
    operator func !():T
}

extend Int32 <: update<Int32>{

}


interface R{
    func r():Int32
    operator func [](b:R):R
    operator func !():R
    operator func -():R
    operator func **(b:R):R
    operator func *(b:R):R
    operator func /(b:R):R
    operator func %(b:R):R
    operator func +(b:R):R
    operator func -(b:R):R
    operator func <<(b:R):R
    operator func >>(b:R):R
    operator func <(b:R):R
    operator func <=(b:R):R
    operator func >(b:R):R
    operator func >=(b:R):R
    operator func ==(b:R):R
    operator func !=(b:R):R
    operator func &(b:R):R
    operator func ^(b:R):R
    operator func |(b:R):R
}

class C <: R{
    var rr : Int32
    func r():Int32{
        rr
    }
    init(r:Int32){
        this.rr = r
    }
    operator func [](b:R):R{
        return C(-2)
    }
    
    operator func !():R{
        return C(!(this.r()))
    }
    operator func -():R{
        return C(-(this.r()))
    }

    operator func **(b:R):R{
        var res : Int32 = 1
        var temp : Int32 = b.r()
        while (temp > 0) {
            res = res * this.r()
            temp = temp - 1
        }
        return C(res)
    }

    operator func *(b:R):R{
        return C((this.r())*(b.r()))
    }
    operator func /(b:R):R{
        return C((this.r())/(b.r()))
    }
    operator func %(b:R):R{
        return C((this.r())%(b.r()))
    }

    operator func +(b:R):R{
        return C((this.r())+(b.r()))
    }
    operator func -(b:R):R{
       return C((this.r())-(b.r()))
    }

    operator func <<(b:R):R{
        return C((this.r())<<(b.r()))
    }
    operator func >>(b:R):R{
        return C((this.r())>>(b.r()))
    }

    operator func <(b:R):R{
        if (this.r() < b.r()) {
            return C(this.r())
        }
        return C(b.r())
    }
    operator func <=(b:R):R{
        if (this.r() <= b.r()) {
            return C(this.r())
        }
        return C(b.r())
    }
    operator func >(b:R):R{
        if (this.r() > b.r()) {
            return C(this.r())
        }
        return C(b.r())
    }
    operator func >=(b:R):R{
        if (this.r() >= b.r()) {
            return C(this.r())
        }
        return C(b.r())
    }

    operator func ==(b:R):R{
        if (this.r() == b.r()) {
            return C(1)
        }
        return C(0)
    }
    operator func !=(b:R):R{
        if (this.r() != b.r()) {
            return C(1)
        }
        return C(0)
    }

    operator func &(b:R):R{
        return C((this.r())&(b.r()))
    }

    operator func ^(b:R):R{
        return C((this.r())^(b.r()))
    }

    operator func |(b:R):R{
        return C((this.r())|(b.r()))
    }


}

func main():Int64{
    var zero : R = C(0)
    var one : R = C(1)
    var two : R = C(2)
    var three : R = C(3)
    var res : R = C(8192)
    var a : R = zero > one << one + three * two ** -zero[zero]
    var final : R =  three ^ one & res == zero > one << one + three * two ** -zero[zero]
    // 1. zero[zero] = C(-2)
    // 2. two ** -zero[zero] = C(4)
    // 3. one + three * two ** -zero[zero] = C(13)
    // 4. one << C(13) = res
    // 5. zero > C(13) = res
    // 6. res == res = one , if 1-5 got any error, 5`s result will be zero.
    // 7. one & one = one , one & zero = zero. So we choose one here.
    // 8. three ^ one = two , one ^ zero = three. So we choose three here.
    // 9. two | two = two , two | three = three. So we choose two here.
    // 10. zero ^^ two = C(123), so final.r = 123
    if (final.r() != 2) {
        return 1
    }

    var first : R
    first = !-C(1) //  first.r == 10
    if (first.r() != 0) {
        return 2
    }

    var second : R
    second = C(2) * C(4) % C(5) / C(2) 
    if (second.r() != 1) {
        return 3
    }

    var third : R
    third = C(-1) + C(5) - C(-2)
    if (third.r() != 6) {
        return 4
    }

    var fourth : R
    fourth = C(1) << C(3) >> C(2)
    if (fourth.r() != 2) {
        return 5
    }

    return 0
}
