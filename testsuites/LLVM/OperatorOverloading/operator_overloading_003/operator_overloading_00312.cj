// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
record R{
    operator func [](b:R):Int32{
        return 1
    }
    operator func **(b:R):Int32{
        return 2
    }
    operator func *(b:R):Int32{
        return 4
    }
    operator func /(b:R):Int32{
        return 8
    }
    operator func %(b:R):Int32{
        return 16
    }
    
    operator func <<(b:R):Int32{
        return 256
    }
    operator func >>(b:R):Int32{
        return 512
    }
    operator func <(b:R):Int32{
        return 1024
    }
    operator func <=(b:R):Int32{
        return 2048
    }
    operator func >(b:R):Int32{
        return 4096
    }
    operator func >=(b:R):Int32{
        return 8192
    }
    operator func ==(b:R):Int32{
        return 16384
    }
    operator func !=(b:R):Int32{
        return 32768
    }
    operator func &(b:R):Int32{
        return 65536
    }
    operator func ^(b:R):Int32{
        return 131072
    }
    operator func |(b:R):Int32{
        return 262144
    }
//    operator func ^^(b:R):Int32{
//        return 524288
//    }

}


class D{
    operator func [](b:D):Int32{
        return 1
    }
    operator func **(b:D):Int32{
        return 2
    }
    operator func *(b:D):Int32{
        return 4
    }
    operator func /(b:D):Int32{
        return 8
    }
    operator func %(b:D):Int32{
        return 16
    }
    
    operator func <<(b:D):Int32{
        return 256
    }
    operator func >>(b:D):Int32{
        return 512
    }
    operator func <(b:D):Int32{
        return 1024
    }
    operator func <=(b:D):Int32{
        return 2048
    }
    operator func >(b:D):Int32{
        return 4096
    }
    operator func >=(b:D):Int32{
        return 8192
    }
    operator func ==(b:D):Int32{
        return 16384
    }
    operator func !=(b:D):Int32{
        return 32768
    }
    operator func &(b:D):Int32{
        return 65536
    }
    operator func ^(b:D):Int32{
        return 131072
    }
    operator func |(b:D):Int32{
        return 262144
    }
//    operator func ^^(b:D):Int32{
//        return 524288
//    }

}

interface I{
    operator func [](b:I):Int32{
        return 1
    }
    operator func **(b:I):Int32{
        return 2
    }
    operator func *(b:I):Int32{
        return 4
    }
    operator func /(b:I):Int32{
        return 8
    }
    operator func %(b:I):Int32{
        return 16
    }
    
    operator func <<(b:I):Int32{
        return 256
    }
    operator func >>(b:I):Int32{
        return 512
    }
    operator func <(b:I):Int32{
        return 1024
    }
    operator func <=(b:I):Int32{
        return 2048
    }
    operator func >(b:I):Int32{
        return 4096
    }
    operator func >=(b:I):Int32{
        return 8192
    }
    operator func ==(b:I):Int32{
        return 16384
    }
    operator func !=(b:I):Int32{
        return 32768
    }
    operator func &(b:I):Int32{
        return 65536
    }
    operator func ^(b:I):Int32{
        return 131072
    }
    operator func |(b:I):Int32{
        return 262144
    }
//    operator func ^^(b:I):Int32{
//        return 524288
//    }

}


class A <: I{}

func main():Int64{
    var a : I = A()
    var c = D()
    var r = R()
    var i : Int32 = 0
    var res1 = (a[a]) + (a**a) + (a*a) + (a/a) + (a%a)
              + (a<<a) + (a>>a) + (a<a) + (a<=a)
             + (a>a) + (a>=a) + (a==a) + (a!=a) + (a&a) + (a^a) + (a|a)
            
    var res2 = (c[c]) + (c**c) + (c*c) + (c/c) + (c%c)
              + (c<<c) + (c>>c) + (c<c) + (c<=c)
             + (c>c) + (c>=c) + (c==c) + (c!=c) + (c&c) + (c^c) + (c|c)
             
    var res3 = (r[r]) + (r**r) + (r*r) + (r/r) + (r%r)
              + (r<<r) + (r>>r) + (r<r) + (r<=r)
             + (r>r) + (r>=r) + (r==r) + (r!=r) + (r&r) + (r^r) + (r|r)
             
    if (res1 != 524063) {
        return 1
    }
    if (res2 != 524063) {
        return 2
    }
    if (res3 != 524063) {
        return 3
    }
    return 0
}
