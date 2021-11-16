// ERRCHECK: %compiler %cmp_opt %n.cj -o %output
// ASSERT: scan redefinition of declaration 'pkgs_dup_package'

package pkgs_dup_package

class pkgs_dup_package {
    var a: Int32 = 1
}


func main(): Int64 {
    let a = pkgs_dup_package().a
    if (a != 1) {
        return 1
    }
    return 0
}
