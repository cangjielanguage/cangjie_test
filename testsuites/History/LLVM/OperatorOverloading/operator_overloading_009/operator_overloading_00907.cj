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

trait stronger {
    operator func [](a:This,b:This):This
    operator func ~(a:This):This
    // operator func !(a:This):This
    operator func +(a:This):This
    operator func -(a:This):This
    operator func **(a:This,b:This):This
    operator func *(a:This,b:This):This
    operator func /(a:This,b:This):This
    operator func %(a:This,b:This):This
    operator func *&(a:This,b:This):This
    operator func +(a:This,b:This):This
    operator func -(a:This,b:This):This
    operator func +&(a:This,b:This):This
    operator func -&(a:This,b:This):This
    operator func <<(a:This,b:This):This
    operator func >>(a:This,b:This):This
    operator func <(a:This,b:This):This
    operator func <=(a:This,b:This):This
    operator func >(a:This,b:This):This
    operator func >=(a:This,b:This):This
    operator func ==(a:This,b:This):This
    operator func !=(a:This,b:This):This
    operator func &(a:This,b:This):This
    operator func ^(a:This,b:This):This
    operator func |(a:This,b:This):This
//     operator func ^^(a:This,b:This):This
}

interface R {}

class C <: R{
    var r : Int32
    init(r:Int32){
        this.r = r
    }
}

append R with stronger,update {
    operator func [](a:R,b:R):R{
        return C(-2)
    }
    
    operator func ~(a:R):R{
        return C(~(a.r))
    }
    operator func !(a:R):R{
        return C(!(a.r))
    }
    operator func +(a:R):R{
        return C(+(a.r))
    }
    operator func -(a:R):R{
        return C(-(a.r))
    }

    operator func **(a:R,b:R):R{
        var res : Int32 = 1
        var temp : Int32 = b.r
        while (temp > 0) {
            res = res * a.r
            temp = temp - 1
        }
        return C(res)
    }

    operator func *(a:R,b:R):R{
        return C((a.r)*(b.r))
    }
    operator func /(a:R,b:R):R{
        return C((a.r)/(b.r))
    }
    operator func %(a:R,b:R):R{
        return C((a.r)%(b.r))
    }
    operator func *&(a:R,b:R):R{
        // return C((a.r)*&(b.r))
        return C((a.r)*(b.r))
    }

    operator func +&(a:R,b:R):R{
        // return C((a.r)+&(b.r))
        return C((a.r)+(b.r))
    }
    operator func -&(a:R,b:R):R{
       // return C((a.r)-&(b.r))
       return C((a.r)-(b.r))
    }
    operator func +(a:R,b:R):R{
        return C((a.r)+(b.r))
    }
    operator func -(a:R,b:R):R{
       return C((a.r)-(b.r))
    }

    operator func <<(a:R,b:R):R{
        return C((a.r)<<(b.r))
    }
    operator func >>(a:R,b:R):R{
        return C((a.r)>>(b.r))
    }

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

    operator func &(a:R,b:R):R{
        return C((a.r)&(b.r))
    }

    operator func ^(a:R,b:R):R{
        return C((a.r)^(b.r))
    }

    operator func |(a:R,b:R):R{
        return C((a.r)|(b.r))
    }

//     operator func ^^(a:R,b:R):R{
//         if (b.r == 2) {
//             return C(123)
//         }
//         if (b.r == 3) {
//             return C(321)
//         }
//         return C(0)
//     }
}



func main():Int64{
    var zero : R = C(0)
    var one : R = C(1)
    var two : R = C(2)
    var three : R = C(3)
    var res : R = C(8192)
    var a : R = zero > one << one + three * two ** -zero[zero]
    var final : R = two | three ^ one & res == zero > one << one + three * two ** -zero[zero]
    // 1. zero[zero] = C(-2)
    // 2. two ** -zero[zero] = C(4)
    // 3. one + three * two ** -zero[zero] = C(13)
    // 4. one << C(13) = res
    // 5. zero > C(13) = res
    // 6. res == res = one , if 1-5 got any error, 5`s result will be zero.
    // 7. one & one = one , one & zero = zero. So we choose one here.
    // 8. three ^ one = two , one ^ zero = three. So we choose three here.
    // 9. two | two = two , two | three = three. So we choose two here.
    if (final.r != 2) {
        return 1
    }

    var first : R
    first = !~-+C(1) //  first.r == 10
    if (first.r != 10) {
        return 2
    }

    var second : R
    second = C(2) * C(4) % C(5) / C(2) *& C(3)
    if (second.r != 3) {
        return 3
    }

    var third : R
    third = C(-1) + C(5) +& C(-3) -& C(2) - C(-2)
    if (third.r != 1) {
        return 4
    }

    var fourth : R
    fourth = C(1) << C(3) >> C(2)
    if (fourth.r != 2) {
        return 5
    }

    return 0
}
