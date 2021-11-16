package p2

external import p1.C1 // class C1 of pkg1 must be re-exported.
external func f() {
    let c = C1()
    return c
}
external class C2{}
