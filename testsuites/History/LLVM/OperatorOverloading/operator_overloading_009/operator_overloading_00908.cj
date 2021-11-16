// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

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
extend Array<Int32> <: update  {
    operator func !(a:Array<Int32>):Array<Int32>{
        return {!a[0]}
    }
}

extend Array<Int32> <: stronger{
    operator func [](a:Array<Int32>,b:Array<Int32>):Array<Int32>{
        return {-2}
    }
    
    operator func ~(a:Array<Int32>):Array<Int32>{
        return {~a[0]}
    }

    operator func +(a:Array<Int32>):Array<Int32>{
        return {+a[0]}
    }
    operator func -(a:Array<Int32>):Array<Int32>{
        return {-a[0]}
    }

    operator func **(a:Array<Int32>,b:Array<Int32>):Array<Int32>{
        var res : Int32 = 1
        var temp : Int32 = b[0]
        while (temp > 0) {
            res = res * a[0]
            temp = temp - 1
        }
        return {res}
    }

    operator func *(a:Array<Int32>,b:Array<Int32>):Array<Int32>{
        return {(a[0])*(b[0])}
    }
    operator func /(a:Array<Int32>,b:Array<Int32>):Array<Int32>{
        return {(a[0])/(b[0])}
    }
    operator func %(a:Array<Int32>,b:Array<Int32>):Array<Int32>{
        return {(a[0])%(b[0])}
    }
    operator func *&(a:Array<Int32>,b:Array<Int32>):Array<Int32>{
        // return {(a[0])*&(b[0])}
        return {(a[0])*(b[0])}
    }

    operator func +&(a:Array<Int32>,b:Array<Int32>):Array<Int32>{
        // return {(a[0])+&(b[0])}
        return {(a[0])+(b[0])}
    }
    operator func -&(a:Array<Int32>,b:Array<Int32>):Array<Int32>{
       // return {(a[0])-&(b[0])}
       return {(a[0])-(b[0])}
    }
    operator func +(a:Array<Int32>,b:Array<Int32>):Array<Int32>{
        return {(a[0])+(b[0])}
    }
    operator func -(a:Array<Int32>,b:Array<Int32>):Array<Int32>{
       return {(a[0])-(b[0])}
    }

    operator func <<(a:Array<Int32>,b:Array<Int32>):Array<Int32>{
        return {(a[0])<<(b[0])}
    }
    operator func >>(a:Array<Int32>,b:Array<Int32>):Array<Int32>{
        return {(a[0])>>(b[0])}
    }

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

    operator func &(a:Array<Int32>,b:Array<Int32>):Array<Int32>{
        return {(a[0])&(b[0])}
    }

    operator func ^(a:Array<Int32>,b:Array<Int32>):Array<Int32>{
        return {(a[0])^(b[0])}
    }

    operator func |(a:Array<Int32>,b:Array<Int32>):Array<Int32>{
        return {(a[0])|(b[0])}
    }

//    operator func ^^(a:Array<Int32>,b:Array<Int32>):Array<Int32>{
//        if (b[0] == 2) {
//            return {123}
//        }
//        if (b[0] == 3) {
//            return {321}
//        }
//        return {0}
//    }
}



func main():Int64{
    var zero : Array<Int32> = {0}
    var one : Array<Int32> = {1}
    var two : Array<Int32> = {2}
    var three : Array<Int32> = {3}
    var res : Array<Int32> = {8192}
    var a : Array<Int32> = zero > one << one + three * two ** -zero[zero]
    var final : Array<Int32> = two | three ^ one & res == zero > one << one + three * two ** -zero[zero]
    // 1. zero[zero] = {-2}
    // 2. two ** -zero[zero] = {4}
    // 3. one + three * two ** -zero[zero] = {13}
    // 4. one << {13} = res
    // 5. zero > {13} = res
    // 6. res == res = one , if 1-5 got any error, 5`s result will be zero.
    // 7. one & one = one , one & zero = zero. So we choose one here.
    // 8. three ^ one = two , one ^ zero = three. So we choose three here.
    // 9. two | two = two , two | three = three. So we choose two here.
    if (final[0] != 2) {
        return 1
    }

    var four : Array<Int32> = {4}
    var five : Array<Int32> = {5}
    var n_one : Array<Int32> = {-1}
    var n_two : Array<Int32> = {-2}
    var n_three : Array<Int32> = {-3}

    var first : Array<Int32>
    first = !~-+one //  first[0] == 10
    if (first[0] != 10) {
        return 2
    }

    var second : Array<Int32>
    second = two * four % five / two *& three
    if (second[0] != 3) {
        return 3
    }

    var third : Array<Int32>
    third = n_one + five +& n_three -& two - n_two
    if (third[0] != 1) {
        return 4
    }

    var fourth : Array<Int32>
    fourth = one << three >> two
    if (fourth[0] != 2) {
        return 5
    }

    return 0
}
