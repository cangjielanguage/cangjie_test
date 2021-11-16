// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle && %copycharjs src/pkga
// EXEC: %compiler %cmp_opt -c src/pkgb/pkgb.cj -o pkgb.%middle && %copycharjs src/pkgb
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle && %copycharjs src/pkga
// EXEC: %compiler %cmp_opt -c src/pkgb/pkgb.cj -o pkgb.%middle && %copycharjs src/pkgb
// EXEC: %compiler %cmp_opt -c src/pkgc/pkgc.cj -o pkgc.%middle && %copycharjs src/pkgc
// EXEC: %compiler %cmp_opt -c src/pkgd/pkgd.cj -o pkgd.%middle && %copycharjs src/pkgd
// EXEC: %compiler %cmp_opt -c src/pkge/pkge.cj -o pkge.%middle && %copycharjs src/pkge
// EXEC: %compiler %cmp_opt -c src/pkgf/pkgf.cj -o pkgf.%middle && %copycharjs src/pkgf
// EXEC: %compiler %cmp_opt -c src/pkgg/pkgg.cj -o pkgg.%middle && %copycharjs src/pkgg
// EXEC: %compiler %cmp_opt -c src/pkgh/pkgh.cj -o pkgh.%middle && %copycharjs src/pkgh
// EXEC: %compiler %cmp_opt -c src/pkgi/pkgi.cj -o pkgi.%middle && %copycharjs src/pkgi
// EXEC: %compiler %cmp_opt -c src/pkgj/pkgj.cj -o pkgj.%middle && %copycharjs src/pkgj
// EXEC: %compiler %cmp_opt %f  pkga.%middle pkgb.%middle pkgc.%middle pkgd.%middle pkge.%middle pkgf.%middle pkgg.%middle pkgh.%middle pkgi.%middle pkgj.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.*
import pkgb.*
import pkgc.*
import pkgd.*
import pkge.*
import pkgf.*
import pkgg.*
import pkgh.*
import pkgi.*
import pkgj.*

func main(): Int64 {
    let a = pkga.one
    let b = pkgb.two
    let c = pkgc.three
    let d = pkgd.four
    let e = pkge.five
    let f = pkgf.six
    let g = pkgg.seven
    let h = pkgh.eight
    let i = pkgi.nine
    let j = pkgj.ten
    let res = a + b + c + d + e + f + g + h + i + j
    if (res != 55) {
        return 1
    }
    return 0
}