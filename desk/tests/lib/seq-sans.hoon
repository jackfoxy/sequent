::  tests/lib/seq-sans/hoon    :: fsharp/tests/FSharp.Core.UnitTests/FSharp.Core/Microsoft.FSharp.Collections/ArrayModule2.fs
/+  *seq, *test
|%


::  +split-all
++  test-split-all-example-00
  %+  expect-eq
    !>  ~[~ "cdef" "hijk" "lmn"]
    !>  (split-all "abcdefabhijkablmn" "ab")


--
