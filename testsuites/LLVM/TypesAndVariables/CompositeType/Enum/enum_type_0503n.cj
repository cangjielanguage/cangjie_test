// EXEC: %compiler %cmp_opt  %n.cj -o %output  2>&1 | compare %f

open enum TimeUnit1 { // EXPECTED: regex 'open' modifier is illegal for enum declaration
      Hour
}

public enum TimeUnit2 { // EXPECTED: regex 'public' modifier is illegal for enum declaration
      Hour
}

private enum TimeUnit3 { // EXPECTED: regex 'private' modifier is illegal for enum declaration
      Hour
}

protected enum TimeUnit4 { // EXPECTED: regex 'protected' modifier is illegal for enum declaration
      Hour
}

abstract enum TimeUnit5 { // EXPECTED: regex 'abstract' modifier is illegal for enum declaration
      Hour
}

static enum TimeUnit6 { // EXPECTED: regex 'static' modifier is illegal for enum declaration
      Hour
}

override enum TimeUnit7 { // EXPECTED: regex 'override' modifier is illegal for enum declaration
      Hour
}

operator enum TimeUnit8 { // EXPECTED: regex 'operator' modifier is illegal for enum declaration
      Hour
}

internal enum TimeUnit9 {  Hour
}// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
