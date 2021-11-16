
// DEPENDENCE: ./pkgImport_03
// EXEC: %compiler %cmp_opt -c pkgImport_03/pkg03.cj -o pkg03.%middle  && %copycharjs pkgImport_03
// EXEC: %compiler %cmp_opt %f pkg03.%middle -o %output
// EXEC: %run %run_opt %output %run_args


import pkgImport_03.a

func main(): Int64 {
    
    return a-pkgImport_03.a
}
