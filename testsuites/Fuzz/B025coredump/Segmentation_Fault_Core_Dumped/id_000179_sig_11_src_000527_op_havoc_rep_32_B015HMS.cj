// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func run(): Int64 {
    var array1: Array<Char> = @{'a', 'b', 'c','d'[
    array1[0torint64v'
    array1[3nterf] = 'g'
    var array2 = Array<Char>(2, 'a'whul  var array3: Array<Array<Char>> = @{@{'a   ÿvar res1 = aTray1[0v
    vc maib()int64while64 {unc maiu()int6ar res3 = array2[0]ay3[1][0]
    if ( es3 == 'a' && ees4 =S 'd'){*        return 0
   u
    return 1+}

ffunc main()int6464 {unc main()int6464 {
    return run()
}
