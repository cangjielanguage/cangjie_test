// DEPENDENCE: p1
// EXEC: %clang -shared -fPIC p1/native.c -o libnative.so
// EXEC: %compiler %cmp_opt  p1/a.cj -backend-options='-shared -fPIC' -o liba.so
// EXEC: %compiler %cmp_opt  -backend-options="-L %%libdir/../lib -lcangjie-ffic -L./ -lnative -la" %f -o %output
// EXEC: %run %run_opt %output %run_args

import p1.*

func main() {
    let a = A<Int32>()
    let b = a.goo()
    let c = a.noo()
    let d = C<Bool>()
    let e = d.a.bar()
    if(b != 1800) {
        return 1
    }
    if(c !=4200) {
        return 2
    }
    if(e != 200) {
        return 3
    }
    return 0
}