package p2

external import p1.C // class C of pkg1 must be re-exported.
external func f() {
    let c = C()
    return c
}
