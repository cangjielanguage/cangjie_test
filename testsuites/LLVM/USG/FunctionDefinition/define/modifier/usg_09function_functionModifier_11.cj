// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// check the private modifier in record
record R{
  private func a(){
  }
}

func main(): Int64{
    let d = R().a // EXPECTED: regex can not access function 'a'
    return 0
}