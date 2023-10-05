::  tests/lib/seq/hoon    :: fsharp/tests/FSharp.Core.UnitTests/FSharp.Core/Microsoft.FSharp.Collections/ArrayModule2.fs
/+  *seq, *test
|%
::
::  +all-pairs
++  test-all-pairs-00
  %+  expect-eq
    !>  ~[[1 2]]
    !>  (all-pairs ~[1] ~[2])
++  test-all-pairs-01
  %+  expect-eq
    !>  ~[["cc" 3] ["cc" 2] ["cc" 1] ["bb" 3] ["bb" 2] ["bb" 1] ["aa" 3] ["aa" 2] ["aa" 1]]
    !>  `(list [tape @ud])`(all-pairs ~["aa" "bb" "cc"] ~[1 2 3])
++  test-all-pairs-example-00  ::  tests wetness
  %+  expect-eq
    !>  ~[['c' 3] ['c' 2] ['c' 1] ['b' 3] ['b' 2] ['b' 1] ['a' 3] ['a' 2] ['a' 1]]
    !>  (all-pairs ~['a' 'b' 'c'] ~[1 2 3])
::
::  +append
++  test-append-00
  %+  expect-eq
    !>  ~
    !>  (append ~ ~)
++  test-append-01
  %+  expect-eq
    !>  ~[1]
    !>  (append ~[1] `(list)`~)
++  test-append-02
  %+  expect-eq
    !>  ~[1]
    !>  (append ~ ~[1])
++  test-append-03
  %+  expect-eq
    !>  ~[1 2]
    !>  (append ~[1] ~[2])
++  test-append-04
  %+  expect-eq
    !>  ~["a" "b" "D"]
    !>  (append ~["a" "b"] ~["D"])
++  test-append-05
  %+  expect-eq
    !>  ~["a" "C" "D"]
    !>  (append ~["a"] ~["C" "D"])
++  test-append-06
  %+  expect-eq
    !>  ~["a" "b" "C" "D"]
    !>  (append ~["a" "b"] ~["C" "D"])
++  test-append-example-00  ::  tests wetness
  %+  expect-eq
    !>  "urbit"
    !>  (append "urb" "it")
++  test-append-example-02
  %+  expect-eq
    !>  ~[1 2 3 4]
    !>  (append (limo [1 2 ~]) (limo [3 4 ~]))
::
::  +average
++  test-average-00
  %+  expect-eq
    !>  3
    !>  (average (limo ~[3]))
++  test-average-example-00
  %+  expect-eq
    !>  2
    !>  (average `(list @ud)`~[1 2 3 4])
++  test-average-fail-00
  %-  expect-fail
  |.  (average (limo ~))
::  +average-by
++  test-average-by-00
  %+  expect-eq
    !>  6
    !>  (average-by (limo ~[[3 3]]) |=([a=@ b=@] (add a b)))
++  test-average-by-example-00
  %+  expect-eq
    !>  5
    !>  (average-by (limo ~[[1 1] [2 2] [3 3] [4 4]]) |=([a=@ b=@] (add a b)))
++  test-average-by-fail-00
  %-  expect-fail
  |.  (average-by (limo ~) |=([a=@ b=@] (add a b)))
::
::  +choose
++  test-choose-00
  %+  expect-eq
    !>  ~
    !>  (choose ~ |=(a=@ ?:((lth a 5) `a ~)))
++  test-choose-01
  %+  expect-eq
    !>  ~
    !>  (choose ~[5] |=(a=@ ?:((lth a 5) `a ~)))
++  test-choose-02
  %+  expect-eq
    !>  ~[1]
    !>  (choose ~[1] |=(a=@ ?:((lth a 5) `a ~)))
++  test-choose-03
  %+  expect-eq
    !>  ~[1]
    !>  (choose ~[1 5] |=(a=@ ?:((lth a 5) `a ~)))
++  test-choose-04
  %+  expect-eq
    !>  ~[1 2 3 4 4 3 2]
    !>  (choose ~[1 2 3 4 5 6 7 4 3 2] |=(a=@ ?:((lth a 5) `a ~)))
++  test-choose-example-00    ::  test wetness
  %+  expect-eq
    !>  [i=12 t=[i=13 t=~]]
    !>  (choose `(list @)`[0 1 2 3 ~] |=(a=@ ?.((gte a 2) ~ (some (add a 10)))))
::
::  +chunk-by-size
++  test-chunk-by-size-00
  %+  expect-eq
    !>  [i=~ t=~]
    !>  (chunk-by-size `(list)`~ 2)
++  test-chunk-by-size-01
  %+  expect-eq
    !>  [i=~[1] t=~]
    !>  (chunk-by-size `(list)`~[1] 1)
++  test-chunk-by-size-02
  %+  expect-eq
    !>  [i=~[1] t=~]
    !>  (chunk-by-size `(list)`~[1] 2)
++  test-chunk-by-size-03
  %+  expect-eq
    !>  [i=~[1] t=[i=~[2] t=~]]
    !>  (chunk-by-size `(list)`~[1 2] 1)
++  test-chunk-by-size-04
  %+  expect-eq
    !>  ~["ur" "bi" "t"]
    !>  (chunk-by-size "urbit" 2)
++  test-chunk-by-size-fail-00
  %-  expect-fail
  |.  (chunk-by-size `(list)`~[1] 0)
++  test-chunk-by-size-example-01
  %+  expect-eq
    !>  [i=~[1 2] t=[i=~[3 4] t=~[~[5 6] ~[7]]]]
    !>  (chunk-by-size (limo ~[1 2 3 4 5 6 7]) 2)
::
::  +collect
++  test-collect-00
  %+  expect-eq
    !>  ~
    !>  (collect ~ |=(a=* (limo ~[a a])))
++  test-collect-01
  %+  expect-eq
    !>  ~[1 1]
    !>  (collect (limo ~[1]) |=(a=* (limo ~[a a])))
++  test-collect-02
  %+  expect-eq
    !>  ~[~[97 97] ~[97 97] ~[98 98] ~[98 98] ~[99 99] ~[99 99]]
    !>  (collect (limo ~["aa" "bb" "cc"]) |=(a=* (limo ~[a a])))
++  test-collect-example-00
  %+  expect-eq
    !>  ~[1 1 2 2 3 3]
    !>  (collect (limo ~[1 2 3]) |=(a=* (limo ~[a a])))
::
::  +compare
++  test-compare-00
  %+  expect-eq
    !>  ~
    !>  (compare ~ ~ aor)
++  test-compare-01
  %+  expect-eq
    !>  ~[%.n] 
    !>  (compare `(list @)`~[1] ~ aor)
++  test-compare-02
  %+  expect-eq
    !>  ~[%.y]
    !>  (compare ~ `(list @)`~[1] aor)
++  test-compare-03
  %+  expect-eq
    !>  ~[%.y %.n]
    !>  (compare `(list @)`~[1 2] `(list @)`~[1] dor)
++  test-compare-04
  %+  expect-eq
    !>  ~[%.y %.y]
    !>  (compare `(list @)`~[1] `(list @)`~[1 2] dor)
++  test-compare-example-00
  %+  expect-eq
    !>  ~[%.n %.y %.n %.y]
    !>  (compare "when" "than" aor)
::
::  +concat
++  test-concat-00
  %+  expect-eq
    !>  ~
    !>  (concat ~)
++  test-concat-01
  %+  expect-eq
    !>  ~[1]
    !>  (concat ~[~[1]])
++  test-concat-02
  %+  expect-eq
    !>  ~[1 2]
    !>  (concat ~[~[1] ~[2]])
++  test-concat-03
  %+  expect-eq
    !>  ~[1 2 3]
    !>  (concat ~[~[1] ~[2 3]])
++  test-concat-04
  %+  expect-eq
    !>  ~[1 2 3]
    !>  (concat ~[~[1 2] ~[3]])
++  test-concat-05
  %+  expect-eq
    !>  ~[1 2 3 4 5 6 7 4 3 2]
    !>  (concat ~[~[1] ~[2 3] ~[4 5 6] ~[7 4 3] ~[2]])
::  ++  test-concat-wetness  ::  test wetness?
++  test-concat-example-00
  %+  expect-eq
    !>  ~['a' 'b' 'c' 'e' 'f' 'g' 'h' 'i' 'j']
    !>  (concat (limo [(limo ['a' 'b' 'c' ~]) (limo ['e' 'f' 'g' ~]) (limo ['h' 'i' 'j' ~]) ~]))
++  test-concat-example-02
  %+  expect-eq
    !>  ~[1 97 2 98 3 99 4 100]
    !>  (concat (limo [(limo [1 'a' 2 'b' ~]) (limo [3 'c' 4 'd' ~]) ~]))
::
::  +contains
++  test-contains-00
  %+  expect-eq
    !>  %.n
    !>  (contains `(list)`~ "yep")
++  test-contains-01
  %+  expect-eq
    !>  %.y
    !>  (contains `(list @)`~[1] 1) 
++  test-contains-example-00
  %+  expect-eq
    !>  %.y
    !>  (contains `(list tape)`~["nope" "yep"] "yep")
::
::  +count-by
++  test-count-by-00
  %+  expect-eq
    !>  ~
    !>  (count-by `(list tape)`~ |=(a=tape (scag 2 a)))
++  test-count-by-01
  %+  expect-eq
    !>  ~[["wh" 1]]
    !>  (count-by (limo ~["where"]) |=(a=tape `tape`(scag 2 a)))
++  test-count-by-example-00
  %+  expect-eq
    !>  ~[[[i='t' t="h"] 2] [[i='w' t="h"] 2]]
    !>  (count-by (limo ~["where" "when" "there" "then"]) |=(a=tape (scag 2 a)))
::
::  +distinct
++  test-distinct-00
  %+  expect-eq
    !>  ~
    !>  (distinct `(list tape)`~)
++  test-distinct-01
  %+  expect-eq
    !>  ~["tape0"]
    !>  (distinct `(list tape)`~["tape0"])
++  test-distinct-02
  %+  expect-eq
    !>  ~["tape0"]
    !>  (distinct `(list tape)`~["tape0" "tape0"])
++  test-distinct-03
  %+  expect-eq
    !>  ~["tape0" "tape1"]
    !>  (distinct `(list tape)`~["tape0" "tape1" "tape0"])
++  test-distinct-example-00
  %+  expect-eq
    !>  ~["tape1" "tape0"]
    !>  (distinct `(list tape)`~["tape1" "tape0" "tape1" "tape0"])
::  +distinct-by
++  test-distinct-by-00
  %+  expect-eq
    !>  ~
    !>  (distinct-by `(list [@ @])`~ |=([a=@ b=@] (add a b)))
++  test-distinct-by-01
  %+  expect-eq
    !>  ~[[1 1]]
    !>  (distinct-by `(list [@ @])`~[[1 1]] |=([a=@ b=@] (add a b)))
++  test-distinct-by-02
  %+  expect-eq
    !>  ~[[2 1]]
    !>  (distinct-by `(list [@ @])`~[[2 1] [1 2]] |=([a=@ b=@] (add a b)))
++  test-distinct-by-example-00
  %+  expect-eq
    !>  ~[[1 1] [1 2] [1 3]]
    !>  (distinct-by `(list [@ @])`~[[1 1] [1 2] [1 3] [2 1]] |=([a=@ b=@] (add a b)))
::  +empty
++  test-empty-example-00
  %+  expect-eq
    !>  `(list @t)`~
    !>  (empty @t)
::  +exactly-one
++  test-exactly-one-fail-00
  %-  expect-fail
  |.  (exactly-one (limo ~))
++  test-exactly-one-fail-01
  %-  expect-fail
  |.  (exactly-one (limo ~["tape" ""]))
++  test-exactly-one-example-00
  %+  expect-eq
    !>  "tape"
    !>  (exactly-one (limo ~["tape"]))
::  +except
++  test-except-00
  %+  expect-eq
    !>  ~
    !>  (except `(list tape)`~ `(list tape)`~)
++  test-except-01
  %+  expect-eq
    !>  ~
    !>  (except `(list tape)`~ (limo ~["able" "baker"]))
++  test-except-02
  %+  expect-eq
    !>  ~["able" "baker"]
    !>  (except (limo ~["able" "baker"]) `(list tape)`~)
++  test-except-03
  %+  expect-eq
    !>  ~
    !>  (except (limo ~["able"]) (limo ~["able" "baker"]))
++  test-except-example-00
  %+  expect-eq
    !>  ~[[i='a' t="ble"] [i='c' t="harlie"]]
    !>  (except (limo ~["able" "baker" "charlie" "dog"]) (limo ~["baker" "dog"]))
::  +exists
++  test-exists-00
  %+  expect-eq
    !>  %.n
    !>  (exists (limo ~) |=(a=tape ?:(?&(=(4 (lent a)) =('a' -.a)) %.y %.n)))
++  test-exists-01
  %+  expect-eq
    !>  %.n
    !>  (exists (limo ~["baker"]) |=(a=tape ?:(?&(=(4 (lent a)) =('a' -.a)) %.y %.n)))
++  test-exists-02
  %+  expect-eq
    !>  %.y
    !>  (exists (limo ~["able"]) |=(a=tape ?:(?&(=(4 (lent a)) =('a' -.a)) %.y %.n)))

++  test-exists-example-00
  %+  expect-eq
    !>  %.y
    !>  (exists (limo ~["aaa" "able" "baker" "charlie" "dog"]) |=(a=tape ?:(?&(=(4 (lent a)) =('a' -.a)) %.y %.n)))
::  +exists2
++  test-exists2-00
  %+  expect-eq
    !>  %.n
    !>  (exists2 (limo ~) (limo ~) |=([a=tape b=tape] ?:(=(-.a -.b) %.y %.n)))
++  test-exists2-01
  %+  expect-eq
    !>  %.n
    !>  (exists2 (limo ~["able"]) (limo ~) |=([a=tape b=tape] ?:(=(-.a -.b) %.y %.n)))
++  test-exists2-02
  %+  expect-eq
    !>  %.n
    !>  (exists2 (limo ~) (limo ~["able"]) |=([a=tape b=tape] ?:(=(-.a -.b) %.y %.n)))
++  test-exists2-03
  %+  expect-eq
    !>  %.y
    !>  (exists2 (limo ~["axiom"]) (limo ~["able"]) |=([a=tape b=tape] ?:(=(-.a -.b) %.y %.n)))
++  test-exists2-04
  %+  expect-eq
    !>  %.y
    !>  (exists2 (limo ~["axiom" "butter"]) (limo ~["able"]) |=([a=tape b=tape] ?:(=(-.a -.b) %.y %.n)))
++  test-exists2-05
  %+  expect-eq
    !>  %.y
    !>  (exists2 (limo ~["axiom"]) (limo ~["able" "butter"]) |=([a=tape b=tape] ?:(=(-.a -.b) %.y %.n)))
++  test-exists2-06
  %+  expect-eq
    !>  %.n
    !>  (exists2 (limo ~["axiom"]) (limo ~["butter" "able"]) |=([a=tape b=tape] ?:(=(-.a -.b) %.y %.n)))
++  test-exists2-07
  %+  expect-eq
    !>  %.n
    !>  (exists2 (limo ~["butter" "axiom"]) (limo ~["able"]) |=([a=tape b=tape] ?:(=(-.a -.b) %.y %.n)))
++  test-exists2-example-00
  %+  expect-eq
    !>  %.y
    !>  (exists2 (limo ~["cat" "betty"]) (limo ~["able" "butter"]) |=([a=tape b=tape] ?:(=(-.a -.b) %.y %.n)))
::  +filter
++  test-filter-00
  %+  expect-eq
    !>  ~
    !>  (filter ~ |=(a=@ (lth a 5)))
++  test-filter-01
  %+  expect-eq
    !>  ~
    !>  (filter (limo ~[5]) |=(a=@ (lth a 5)))
++  test-filter-02
  %+  expect-eq
    !>  ~[1]
    !>  (filter (limo ~[1]) |=(a=@ (lth a 5)))
++  test-filter-03
  %+  expect-eq
    !>  ~[1]
    !>  (filter (limo ~[1 5]) |=(a=@ (lth a 5)))
++  test-filter-04
  %+  expect-eq
    !>  ~[1 2 3 4 4 3 2]
    !>  (filter (limo ~[1 2 3 4 5 6 7 4 3 2]) |=(a=@ (lth a 5)))
::  ++  test-filter-wetness  ::  test wetness?
++  test-filter-example-00
  %+  expect-eq
    !>  [i=2 t=~[3]]
    !>  (filter `(list @)`[0 1 2 3 ~] |=(a=@ (gth a 1)))
::  +first-n
++  test-first-n-00
  %+  expect-eq
    !>  ~
    !>  (first-n ~ 0)
++  test-first-n-01
  %+  expect-eq
    !>  ~
    !>  (first-n `(list @)`~[1] 0)
++  test-first-n-02
  %+  expect-eq
    !>  ~
    !>  (first-n `(list)`~ 1)
++  test-first-n-03
  %+  expect-eq
    !>  ~[1]
    !>  (first-n `(list @)`~[1] 1)
++  test-first-n-example-00
  %+  expect-eq
    !>  [i=1 t=~[2]]
    !>  (first-n `(list @)`[1 2 3 4 ~] 2)
++  test-first-n-example-01
  %+  expect-eq
    !>  [i=1 t=~[2 3 4]]
    !>  (first-n `(list @)`[1 2 3 4 ~] 10)
::
::  +fold
++  test-fold-00
  %+  expect-eq
    !>  1
    !>  (fold `(list @)`~ 1 |=([n=@ state=@] (add state (mul n n))))
++  test-fold-01
  %+  expect-eq
    !>  2
    !>  (fold `(list @)`~[1] 1 |=([n=@ state=@] (add state (mul n n))))
++  test-fold-example-00
  %+  expect-eq
    !>  55
    !>  (fold (gulf 1 5) 0 |=([n=@ state=@] (add state (mul n n))))
::  +fold2
++  test-fold2-00
  %+  expect-eq
    !>  0
    !>  (fold2 `(list tape)`~ `(list tape)`~ 0 |=([n1=tape n2=tape state=@] ?:(=(n1 n2) +(state) state)))
++  test-fold2-01
  %+  expect-eq
    !>  0
    !>  (fold2 (limo ~["Tails"]) (limo ~["Head"]) 0 |=([n1=tape n2=tape state=@] ?:(=(n1 n2) +(state) state)))
++  test-fold2-02
  %+  expect-eq
    !>  1
    !>  (fold2 (limo ~["Head"]) (limo ~["Head"]) 0 |=([n1=tape n2=tape state=@] ?:(=(n1 n2) +(state) state)))
++  test-fold2-fail-00
  %-  expect-fail
  |.  (fold2 `(list tape)`~ (limo ~["Head"]) 0 |=([n1=tape n2=tape state=@] ?:(=(n1 n2) +(state) state)))
++  test-fold2-fail-01
  %-  expect-fail
  |.  (fold2 (limo ~["Head"]) `(list tape)`~ 0 |=([n1=tape n2=tape state=@] ?:(=(n1 n2) +(state) state)))
++  test-fold2-example-00
  %+  expect-eq
    !>  2
    !>  (fold2 (limo ~["Tails" "Head" "Tails"]) (limo ~["Tails" "Head" "Head"]) 0 |=([n1=tape n2=tape state=@] ?:(=(n1 n2) +(state) state)))
::  +fold-back
++  test-fold-back-00
  %+  expect-eq
    !>  1
    !>  (fold-back `(list @)`~ 1 |=([n=@ state=@] (add state (mul n n))))
++  test-fold-back-01
  %+  expect-eq
    !>  2
    !>  (fold-back `(list @)`~[1] 1 |=([n=@ state=@] (add state (mul n n))))
++  less-hungry
  |=  [n=tape state=(list [tape @])]
  ^+  state
  ?~  state  (limo ~[[n 1]])
  [[n +(+.i.state)] state]
++  test-fold-back-example-00
  %+  expect-eq
    !>  [i=["Apple" 3] t=~[["Pear" 2] ["Orange" 1]]]
    !>  (fold-back (limo ~["Apple" "Pear" "Orange"]) `(list [tape @])`~ less-hungry)
::  +fold-back2
++  test-fold-back2-00
  %+  expect-eq
    !>  0
    !>  (fold-back2 `(list tape)`~ `(list tape)`~ 0 |=([n1=tape n2=tape state=@] ?:(=(n1 n2) +(state) state)))
++  test-fold-back2-01
  %+  expect-eq
    !>  0
    !>  (fold2 (limo ~["Tails"]) (limo ~["Head"]) 0 |=([n1=tape n2=tape state=@] ?:(=(n1 n2) +(state) state)))
++  test-fold-back2-02
  %+  expect-eq
    !>  1
    !>  (fold-back2 (limo ~["Head"]) (limo ~["Head"]) 0 |=([n1=tape n2=tape state=@] ?:(=(n1 n2) +(state) state)))
++  test-fold-back2-fail-00
  %-  expect-fail
  |.  (fold-back2 `(list tape)`~ (limo ~["Head"]) 0 |=([n1=tape n2=tape state=@] ?:(=(n1 n2) +(state) state)))
++  test-fold-back2-fail-01
  %-  expect-fail
  |.  (fold-back2 (limo ~["Head"]) `(list tape)`~ 0 |=([n1=tape n2=tape state=@] ?:(=(n1 n2) +(state) state)))
++  test-fold-back2-example-00
  %+  expect-eq
    !>  ~["TailsTails" "HeadHead" "TailsHead"]
    !>  (fold-back2 (limo ~["Tails" "Head" "Tails"]) (limo ~["Tails" "Head" "Head"]) `(list tape)`~ |=([n1=tape n2=tape state=(list tape)] [(weld n1 n2) state]))
::  +forall
++  test-forall-00
  %+  expect-eq
    !>  %.y
    !>  (forall `(list @)`~ |=(a=@ ?:(=(0 (mod a 2)) %.y %.n)))
++  test-forall-01
  %+  expect-eq
    !>  %.y
    !>  (forall (limo ~[2]) |=(a=@ ?:(=(0 (mod a 2)) %.y %.n)))
++  test-forall-02
  %+  expect-eq
    !>  %.n
    !>  (forall (limo ~[1]) |=(a=@ ?:(=(0 (mod a 2)) %.y %.n)))
++  test-forall-example-00
  %+  expect-eq
    !>  %.y
    !>  (forall (limo ~[2 4 8]) |=(a=@ ?:(=(0 (mod a 2)) %.y %.n)))
++  test-forall-example-01
  %+  expect-eq
    !>  %.n
    !>  (forall (limo ~[2 1 8]) |=(a=@ ?:(=(0 (mod a 2)) %.y %.n)))
::  +forall2
++  test-forall2-00
  %+  expect-eq
    !>  %.y
    !>  (forall2 `(list @)`~ `(list @)`~ |=([a=@ b=@] ?:(=(0 (mod (add a b) 2)) %.y %.n)))
++  test-forall2-01
  %+  expect-eq
    !>  %.y
    !>  (forall2 (limo ~[2]) (limo ~[4]) |=([a=@ b=@] ?:(=(0 (mod (add a b) 2)) %.y %.n)))
++  test-forall2-02
  %+  expect-eq
    !>  %.n
    !>  (forall2 (limo ~[1]) (limo ~[4]) |=([a=@ b=@] ?:(=(0 (mod (add a b) 2)) %.y %.n)))
++  test-forall2-fail-00
  %-  expect-fail
  |.  (forall2 (limo ~[1]) (limo ~[4 5]) |=([a=@ b=@] ?:(=(0 (mod (add a b) 2)) %.y %.n)))
++  test-forall2-fail-01
  %-  expect-fail
  |.  (forall2 (limo ~[1 2 3]) (limo ~[4 5]) |=([a=@ b=@] ?:(=(0 (mod (add a b) 2)) %.y %.n)))
++  test-forall2-example-00
  %+  expect-eq
    !>  %.y
    !>  (forall2 (limo ~[1 4 8]) (limo ~[3 4 8]) |=([a=@ b=@] ?:(=(0 (mod (add a b) 2)) %.y %.n)))
++  test-forall2-example-01
  %+  expect-eq
    !>  %.n
    !>  (forall2 (limo ~[1 5 8]) (limo ~[3 4 8]) |=([a=@ b=@] ?:(=(0 (mod (add a b) 2)) %.y %.n)))
::  +get-head
++  test-get-head-00
  %+  expect-eq
    !>  1
    !>  (get-head ~[1])
++  test-get-head-fail-00
  %-  expect-fail
  |.  (get-head ~)
++  test-get-head-example-00
  %+  expect-eq
    !>  1
    !>  (get-head ~[1 2])
::  +get-tail
++  test-get-tail-00
  %+  expect-eq
    !>  ~
    !>  (get-tail ~[1])
++  test-get-tail-fail-00
  %-  expect-fail
  |.  (get-tail ~)
++  test-get-tail-example-00
  %+  expect-eq
    !>  ~[2]
    !>  (get-tail ~[1 2])

::  +group-by
++  test-group-by-00
  %+  expect-eq
    !>  ~
    !>  (group-by `(list @)`~ |=(a=@ (mod a 2)))
++  test-group-by-01
  %+  expect-eq
    !>  ~[[p=1 q=[i=1 t=~]]]
    !>  (group-by `(list @)`~[1] |=(a=@ (mod a 2)))
++  test-group-by-example-00
  %+  expect-eq
    !>  ~[[p=0 q=[i=4 t=~[[2 0]]]] [p=1 q=[i=5 t=~[[3 [1 0] 0]]]]]
    !>  (group-by (gulf 1 5) |=(a=@ (mod a 2)))
::  +indexed
++  test-indexed-00
  %+  expect-eq
    !>  ~
    !>  (indexed `(list @)`~)
++  test-indexed-01
  %+  expect-eq
    !>  ~[[0 1]]
    !>  (indexed (limo ~[1]))
++  test-indexed-example-00
  %+  expect-eq
    !>  ~[[0 1] [1 2] [2 3]]
    !>  (indexed (gulf 1 3))
::  +init
++  test-init-00
  %+  expect-eq
    !>  ~[6]
    !>  (init 1 |=(a=@ (add a 5)))
++  test-init-fail-00
  %-  expect-fail
  |.  (init 0 |=(a=@ (add a 5)))
++  test-init-example-00
  %+  expect-eq
    !>  ~[6 7 8]
    !>  (init 3 |=(a=@ (add a 5)))
::  +insert-at
++  test-insert-at-00
  %+  expect-eq
    !>  ~[1]
    !>  (insert-at `(list @)`~ 0 1)
++  test-insert-at-01
  %+  expect-eq
    !>  ~[2 1]
    !>  (insert-at (limo ~[1]) 0 2)
++  test-insert-at-02
  %+  expect-eq
    !>  ~[1 2]
    !>  (insert-at (limo ~[1]) 1 2)
++  test-insert-at-03
  %+  expect-eq
    !>  ~[3 1 2]
    !>  (insert-at (limo ~[1 2]) 0 3)
++  test-insert-at-04
  %+  expect-eq
    !>  ~[1 3 2]
    !>  (insert-at (limo ~[1 2]) 1 3)
++  test-insert-at-05
  %+  expect-eq
    !>  ~[1 2 3]
    !>  (insert-at (limo ~[1 2]) 2 3)
::  ++  test-insert-at-wetness  ::  test wetness?
++  test-insert-at-example-00
  %+  expect-eq
    !>  [i=2 t=~[11 3 4]]
    !>  (insert-at (limo ~[2 3 4]) 1 11)
::  +insert-many-at
++  test-insert-many-at-00
  %+  expect-eq
    !>  ~
    !>  (insert-many-at `(list @)`~ `(list @)`~ 0)
++  test-insert-many-at-01
  %+  expect-eq
    !>  ~[3 4]
    !>  (insert-many-at `(list @)`~ (limo ~[3 4]) 0)
++  test-insert-many-at-02
  %+  expect-eq
    !>  ~[1 2]
    !>  (insert-many-at (limo ~[1 2]) `(list @)`~ 1)
++  test-insert-many-at-03
  %+  expect-eq
    !>  ~[1 2 3 4]
    !>  (insert-many-at (limo ~[1 2]) (limo ~[3 4]) 2)
++  test-insert-many-at-fail-00
  %-  expect-fail
  |.  (insert-many-at (limo ~[1 2]) (limo ~[3 4]) 3)
++  test-insert-many-at-example-00
  %+  expect-eq
    !>  ~[1 2 3 4 5 6 7]
    !>  (insert-many-at (limo ~[1 2 5 6 7]) (limo ~[3 4]) 2)
::  +is-empty
++  test-is-empty-example-00
  %+  expect-eq
    !>  %.n
    !>  (is-empty `(list @)`~[2])
++  test-is-empty-example-01
  %+  expect-eq
    !>  %.y
    !>  (is-empty `(list @)`~)
::  +item
++  test-item-00
  %+  expect-eq
    !>  "aa"
    !>  (item `(list tape)`~["aa"] 0)
++  test-item-01
  %+  expect-eq
    !>  "aa"
    !>  (item `(list tape)`~["aa" "bb"] 0)
++  test-item-02
  %+  expect-eq
    !>  "bb"
    !>  (item `(list tape)`~["aa" "bb"] 1)
++  test-item-fail-00
  %-  expect-fail
  |.  (item `(list tape)`~ 0)
++  test-item-fail-01
  %-  expect-fail
  |.  (item `(list tape)`~["aa" "bb"] 2)
++  test-item-example-00
  %+  expect-eq
    !>  "cc"
    !>  (item `(list tape)`~["aa" "bb" "cc" "dd"] 2)
::  +iter
++  test-iter-00
  %+  expect-eq
    !>  ~
    !>  (iter `(list tape)`~ |=(a=tape (lent a)))
++  test-iter-01
  %+  expect-eq
    !>  ~
    !>  (iter (limo ~["tape1"]) |=(a=tape (lent a)))
++  test-iter-example-00
  %+  expect-eq
    !>  ~
    !>  (iter (limo ~["tape1" "tape2"]) |=(a=tape (lent a)))
::  +iter2
++  test-iter2-00
  %+  expect-eq
    !>  ~
    !>  (iter2 `(list tape)`~ `(list tape)`~ |=([a=tape b=tape] (add (lent a) (lent b))))
++  test-iter2-01
  %+  expect-eq
    !>  ~
    !>  (iter2 (limo ~["tape1"]) (limo ~["tape2"]) |=([a=tape b=tape] (add (lent a) (lent b))))
++  test-iter2-fail-00
  %-  expect-fail
  |.  (iter2 (limo ~["tape1" "tape2"]) (limo ~["tape3"]) |=([a=tape b=tape] (add (lent a) (lent b))))
++  test-iter2-fail-01
  %-  expect-fail
  |.  (iter2 (limo ~["tape1"]) (limo ~["tape2" "tape3"]) |=([a=tape b=tape] (add (lent a) (lent b))))
++  test-iter2-example-00
  %+  expect-eq
    !>  ~
    !>  (iter2 (limo ~["tape1" "tape2"]) (limo ~["tape3" "tape4"]) |=([a=tape b=tape] (add (lent a) (lent b))))
::  +iteri
++  test-iteri-00
  %+  expect-eq
    !>  ~
    !>  (iteri `(list tape)`~ |=([a=@ b=tape] (add (lent b) a)))
++  test-iteri-01
  %+  expect-eq
    !>  ~
    !>  (iteri (limo ~["tape1"]) |=([a=@ b=tape] (add (lent b) a)))
++  test-iteri-example-00
  %+  expect-eq
    !>  ~
    !>  (iteri (limo ~[1 2 3]) |=([a=@ b=@] (add a b)))
::  +iteri2
++  test-iteri2-00
  %+  expect-eq
    !>  ~
    !>  (iteri2 `(list tape)`~ `(list tape)`~ |=([c=@ a=tape b=tape] (add c (add (lent a) (lent b)))))
++  test-iteri2-01
  %+  expect-eq
    !>  ~
    !>  (iteri2 (limo ~["tape1"]) (limo ~["tape2"]) |=([c=@ a=tape b=tape] (add c (add (lent a) (lent b)))))
++  test-iteri2-fail-00
  %-  expect-fail
  |.  (iteri2 (limo ~["tape1" "tape2"]) (limo ~["tape3"]) |=([c=@ a=tape b=tape] (add c (add (lent a) (lent b)))))
++  test-iteri2-fail-01
  %-  expect-fail
  |.  (iteri2 (limo ~["tape1"]) (limo ~["tape2" "tape3"]) |=([c=@ a=tape b=tape] (add c (add (lent a) (lent b)))))
++  test-iteri2-example-00
  %+  expect-eq
    !>  ~
    !>  (iteri2 (limo ~[1 2 3]) (limo ~[4 5 6]) |=([a=@ b=@ c=@] (add (add a b) c)))
::  +last-n
++  test-last-n-00
  %+  expect-eq
    !>  ~
    !>  (last-n `(list @)`~ 0)
++  test-last-n-01
  %+  expect-eq
    !>  ~
    !>  (last-n `(list @)`~[1] 0)
++  test-last-n-02
  %+  expect-eq
    !>  ~
    !>  (last-n `(list)`~ 1)
++  test-last-n-03
  %+  expect-eq
    !>  ~[1]
    !>  (last-n `(list @)`~[1] 1)
++  test-last-n-example-00
  %+  expect-eq
    !>  [i=3 t=~[4]]
    !>  (last-n `(list @)`[1 2 3 4 ~] 2)
++  test-last-n-example-01
  %+  expect-eq
    !>  [i=1 t=~[2 3 4]]
    !>  (last-n `(list @)`[1 2 3 4 ~] 10)
::  +length
++  test-length-00
  %+  expect-eq
    !>  0
    !>  (length ~)
++  test-length-01
  %+  expect-eq
    !>  1
    !>  (length [1 ~])
++  test-length-example-00
  %+  expect-eq
    !>  4
    !>  (length [1 2 3 4 ~])
++  test-length-example-01
  %+  expect-eq
    !>  5
    !>  (length [1 'a' 2 'b' (some 10) ~])
::
::  +map-seq
++  test-map-seq-00
  %+  expect-eq
    !>  ~
    !>  (map-seq ~ @t)
++  test-map-seq-elements-01
  %+  expect-eq
    !>  ~['h']
    !>  (map-seq ~[104] @t)
++  test-map-seq-example-00
  %+  expect-eq
    !>  "hoon"
    !>  (map-seq (limo [104 111 111 110 ~]) @t)
++  test-map-seq-example-01
  %+  expect-eq
    !>  ~[5 6 7 8]
    !>  (map-seq (limo [1 2 3 4 ~]) |=(a=@ (add a 4)))
::  +map2
++  test-map2-00
  %+  expect-eq
    !>  ~
    !>  (map2 `(list @)`~ `(list @)`~ |=(a=[@ @] (add -.a +.a)))
++  test-map2-example-01
  %+  expect-eq
    !>  ~[6]
    !>  (map2 (limo ~[1]) (limo ~[5]) |=(a=[@ @] (add -.a +.a)))
++  test-map2-fail-00
  %-  expect-fail
  |.  (map2 (limo ~[1 2 3]) (limo ~[5 6 7 8]) |=(a=[@ @] (add -.a +.a)))
++  test-map2-fail-01
  %-  expect-fail
  |.  (map2 (limo ~[1 2 3 4]) (limo ~[5 6 7]) |=(a=[@ @] (add -.a +.a)))
++  test-map2-example-00
  %+  expect-eq
    !>  ~[6 8 10 12]
    !>  (map2 (limo ~[1 2 3 4]) (limo ~[5 6 7 8]) |=(a=[@ @] (add -.a +.a)))
::  +map3
++  test-map3-00
  %+  expect-eq
    !>  ~
    !>  (map3 `(list @)`~ `(list @)`~ `(list @)`~ |=(a=[@ @ @] (add (add -.a +<.a) +>.a)))
++  test-map3-01
  %+  expect-eq
    !>  ~[15]
    !>  (map3 (limo ~[1]) (limo ~[5]) (limo ~[9]) |=(a=[@ @ @] (add (add -.a +<.a) +>.a)))
++  test-map3-fail-00
  %-  expect-fail
  |.  (map3 (limo ~[1 2]) (limo ~[5]) (limo ~[9]) |=(a=[@ @ @] (add (add -.a +<.a) +>.a)))
++  test-map3-fail-01
  %-  expect-fail
  |.  (map3 (limo ~[1]) (limo ~[5 6]) (limo ~[9]) |=(a=[@ @ @] (add (add -.a +<.a) +>.a)))
++  test-map3-fail-02
  %-  expect-fail
  |.  (map3 (limo ~[1]) (limo ~[5]) (limo ~[9 10]) |=(a=[@ @ @] (add (add -.a +<.a) +>.a)))
++  test-map3-example-00
  %+  expect-eq
    !>  ~[15 18 21 24]
    !>  (map3 (limo ~[1 2 3 4]) (limo ~[5 6 7 8]) (limo ~[9 10 11 12]) |=(a=[@ @ @] (add (add -.a +<.a) +>.a)))
::  +map-fold
++  map-fold-foo
  |*  [p=[@t @] state=@]
  ^-  [[@t @] @]
  ?:  =(-.p 'in')  [['in' (mul +.p 2)] (add state +.p)]
  [['out' (mul +.p 2)] (mul state +.p)]
++  test-map-fold-00
  %+  expect-eq
    !>  [~ 0]
    !>  (map-fold `(list [@t @])`~ 0 map-fold-foo)
++  test-map-fold-01
  %+  expect-eq
    !>  [~[['in' 2]] 1]
    !>  (map-fold `(list [@t @])`~[['in' 1]] 0 map-fold-foo)
++  test-map-fold-example-00
  %+  expect-eq
    !>  [~[['in' 2] ['out' 4] ['in' 6]] 5]
    !>  (map-fold `(list [@t @])`~[['in' 1] ['out' 2] ['in' 3]] 0 map-fold-foo)
::  +map-fold-back
++  test-map-fold-back-00
  %+  expect-eq
    !>  [~ 0]
    !>  (map-fold-back `(list [@t @])`~ 0 map-fold-foo)
++  test-map-fold-back-01
  %+  expect-eq
    !>  [~[['in' 2]] 1]
    !>  (map-fold-back `(list [@t @])`~[['in' 1]] 0 map-fold-foo)
++  test-map-fold-back-example-00
  %+  expect-eq
    !>  [~[['in' 6] ['out' 4] ['in' 2]] 7]
    !>  (map-fold-back `(list [@t @])`~[['in' 1] ['out' 2] ['in' 3]] 0 map-fold-foo)
::  +mapi
++  test-mapi-00
  %+  expect-eq
    !>  ~
    !>  (mapi `(list @)`~ |=([a=@ b=@] (add a b)))
++  test-mapi-01
  %+  expect-eq
    !>  ~[0]
    !>  (mapi (limo ~[5]) |=([a=@ b=@] (mul a b)))
++  test-mapi-example-00
  %+  expect-eq
    !>  ~[1 3 5]
    !>  (mapi (limo ~[1 2 3]) |=([a=@ b=@] (add a b)))
::  +mapi2
++  test-mapi2-00
  %+  expect-eq
    !>  ~
    !>  (mapi2 `(list @)`~ `(list @)`~ |=([a=@ b=@ c=@] (add (add a b) c)))
++  test-mapi2-01
  %+  expect-eq
    !>  ~[6]
    !>  (mapi2 (limo ~[5]) (limo ~[1]) |=([a=@ b=@ c=@] (add (add a b) c)))
++  test-mapi2-fail-00
  %-  expect-fail
  |.  (mapi2 (limo ~[5]) `(list @)`~ |=([a=@ b=@ c=@] (add (add a b) c)))
++  test-mapi2-fail-01
  %-  expect-fail
  |.  (mapi2 `(list @)`~ (limo ~[1]) |=([a=@ b=@ c=@] (add (add a b) c)))
++  test-mapi2-example-00
  %+  expect-eq
    !>  ~[5 8 11]
    !>  (mapi2 (limo ~[1 2 3]) (limo ~[4 5 6]) |=([a=@ b=@ c=@] (add (add a b) c)))
::  +maxi
++  test-maxi-00
  %+  expect-eq
    !>  12
    !>  (maxi (limo ~[12]))
++  test-maxi-fail-00
  %-  expect-fail
  |.  (maxi `(list @)`~)
++  test-maxi-example-00
  %+  expect-eq
    !>  12
    !>  (maxi (limo ~[10 12 11]))
++  test-maxi-example-01
  %+  expect-eq
    !>  "max"
    !>  (maxi (limo ~["max" "add" "busy"]))
::  +max-by
++  test-max-by-00
  %+  expect-eq
    !>  "aa"
    !>  (max-by (limo ~["aa"]) |=(a=tape (lent a)))
++  test-max-by-fail-00
  %-  expect-fail
  |.  (max-by `(list tape)`~ |=(a=tape (lent a)))
++  test-max-by-example-00
  %+  expect-eq
    !>  "mmmm"
    !>  (max-by (limo ~["aa" "mmmm" "zzz"]) |=(a=tape (lent a)))
::  +mini
++  test-mini-00
  %+  expect-eq
    !>  12
    !>  (mini (limo ~[12]))
++  test-mini-fail-00
  %-  expect-fail
  |.  (mini `(list @)`~)
++  test-mini-example-00
  %+  expect-eq
    !>  10
    !>  (mini (limo ~[10 12 11]))
++  test-mini-example-01
  %+  expect-eq
    !>  "add"
    !>  (mini (limo ~["max" "add" "busy"]))
::  +min-by
++  test-min-by-00
  %+  expect-eq
    !>  "aa"
    !>  (min-by (limo ~["aa"]) |=(a=tape (lent a)))
++  test-min-by-fail-00
  %-  expect-fail
  |.  (min-by `(list tape)`~ |=(a=tape (lent a)))
++  test-min-by-example-00
  %+  expect-eq
    !>  "aa"
    !>  (min-by (limo ~["aa" "mmmm" "zzz"]) |=(a=tape (lent a)))

::  +pairwise
++  test-pairwise-00
  %+  expect-eq
    !>  ~
    !>  (pairwise `(list @)`~)
++  test-pairwise-01
  %+  expect-eq
    !>  ~
    !>  (pairwise (limo ~[1]))
++  test-pairwise-02
  %+  expect-eq
    !>  ~[[1 2]]
    !>  (pairwise (limo ~[1 2]))
++  test-pairwise-03
  %+  expect-eq
    !>  ~[[1 2] [2 3]]
    !>  (pairwise (limo ~[1 2 3]))
++  test-pairwise-example-00
  %+  expect-eq
    !>  ~[[1 2] [2 3] [3 4]]
    !>  (pairwise (limo ~[1 2 3 4]))
::  +partition
++  test-partition-00
  %+  expect-eq
    !>  [p=~ q=~]
    !>  (partition ~ |=(a=@ (gth a 1)))
++  test-partition-01
  %+  expect-eq
    !>  [p=~ q=~[1]]
    !>  (partition (limo ~[1]) |=(a=@ (gth a 1)))
++  test-partition-02
  %+  expect-eq
    !>  [p=~[2] q=~]
    !>  (partition (limo ~[2]) |=(a=@ (gth a 1)))
++  test-partition-example-00
  %+  expect-eq
    !>  [p=[i=2 t=~[3]] q=[i=0 t=~[1]]]
    !>  (partition `(list @)`[0 1 2 3 ~] |=(a=@ (gth a 1)))
::  +permute
++  test-permute-00
  %+  expect-eq
    !>  ~
    !>  (permute `(list @)`~ |=(i=@ (mod +(i) 4)))
++  test-permute-01
  %+  expect-eq
    !>  ~[4]
    !>  (permute (limo ~[4]) |=(i=@ (mod +(i) 1)))
    ++  test-permute-02
  %+  expect-eq
    !>  ~[2 4]
    !>  (permute (limo ~[4 2]) |=(i=@ (mod +(i) 2)))
++  test-permute-example-00
  %+  expect-eq
    !>  ~[4 1 2 3]
    !>  (permute (limo ~[1 2 3 4]) |=(i=@ (mod +(i) 4)))

::  +reduce
::  +reduce-back

::  +remove-at
++  test-remove-at-00
  %+  expect-eq
    !>  ~
    !>  (remove-at (limo ~[1]) 0)
++  test-remove-at-01
  %+  expect-eq
    !>  ~[2]
    !>  (remove-at `(list @)`[1 2 ~] 0)
++  test-remove-at-02
   %+  expect-eq
    !>  ~[1]
    !>  (remove-at `(list @)`[1 2 ~] 1)
++  test-remove-at-fail-00
  %-  expect-fail
  |.  (remove-at ~ 0)
++  test-remove-at-fail-01
  %-  expect-fail
  |.  (remove-at (limo ~[1]) 1)
++  test-remove-at-example-00
  %+  expect-eq
    !>  "good day urbit!"
    !>  (remove-at "good day, urbit!" 8)
++  test-remove-at-example-01
  %+  expect-eq
    !>  ~[1 2 4]
    !>  (remove-at `(list @)`[1 2 3 4 ~] 2)
::  +remove-many-at
++  test-remove-many-at-00
  %+  expect-eq
    !>  ~
    !>  (remove-many-at ~ [0 0])
++  test-remove-many-at-02
  %+  expect-eq
    !>  ~[1]
    !>  (remove-many-at (limo ~[1]) [0 0])
++  test-remove-many-at-03
  %+  expect-eq
    !>  ~[1]
    !>  (remove-many-at (limo ~[1]) [1 0])
++  test-remove-many-at-04
  %+  expect-eq
    !>  ~
    !>  (remove-many-at (limo ~[1]) [0 1])
++  test-remove-many-at-05
   %+  expect-eq
    !>  ~[1 2 5]
    !>  (remove-many-at `(list @)`[1 2 3 4 5 ~] [2 2])
++  test-remove-many-at-06
  %+  expect-eq
    !>  ~[1 2 3 4 5]
    !>  (remove-many-at `(list @)`[1 2 3 4 5 ~] [2 0])
++  test-remove-many-at-fail-00
  %-  expect-fail
  |.  (remove-many-at ~ [0 1])
++  test-remove-many-at-fail-01
  %-  expect-fail
  |.  (remove-many-at ~ [1 0])
++  test-remove-many-at-fail-02
  %-  expect-fail
  |.  (remove-many-at (limo ~[1]) [0 2])
++  test-remove-many-at-example-00
  %+  expect-eq
    !>  "good urbit!"
    !>  (remove-many-at "good day, urbit!" [4 5])
++  test-remove-many-at-example-01
  %+  expect-eq
    !>  ~[1 2]
    !>  (remove-many-at `(list @)`[1 2 3 4 ~] [2 2])
::
::  +replicate
++  test-replicate-00
  %+  expect-eq
    !>  ~
    !>  (replicate 0 %a)
++  test-replicate-01
  %+  expect-eq
    !>  ~[~]
    !>  (replicate 1 ~)
++  test-replicate-02
  %+  expect-eq
    !>  ~[~ ~]
    !>  (replicate 2 ~)
++  test-replicate-example-00
  %+  expect-eq
    !>  ~[%a %a %a %a %a %a %a %a %a %a %a %a %a %a %a %a %a %a %a %a]
    !>  (replicate 20 %a)
++  test-replicate-example-01
  %+  expect-eq
    !>  ~[~s1 ~s1 ~s1 ~s1 ~s1]
    !>  (replicate 5 ~s1)
++  test-replicate-example-02
  %+  expect-eq
    !>  ~s5
    !>  `@dr`(roll (replicate 5 ~s1) add)
::
::  +reverse
++  test-reverse-00
  %+  expect-eq
    !>  ~
    !>  (reverse ~)
++  test-reverse-01
  %+  expect-eq
    !>  ~[1]
    !>  (reverse ~[1])
++  test-reverse-02
  %+  expect-eq
    !>  ~[2 1]
    !>  (reverse ~[1 2])
++  test-reverse-example-00
  %+  expect-eq
    !>  ~[3 2 1]
    !>  (reverse (limo ~[1 2 3]))
::
::  +scan
::  +scan-back
::
::  +search
++  test-search-00
  %+  expect-eq
    !>  15
    !>  (search (limo ~[15]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-search-fail-00
  %-  expect-fail
  |.  (search (limo ~) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-search-fail-01
  %-  expect-fail
  |.  (search (limo ~[14]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-search-fail-02
  %-  expect-fail
  |.  (search (gulf [1 14]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-search-example-00
  %+  expect-eq
    !>  15
    !>  (search (gulf [1 30]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
::  +search-all
++  test-search-all-00
  %+  expect-eq
    !>  ~[15]
    !>  (search-all (limo ~[15]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-search-all-fail-00
  %-  expect-fail
  |.  (search-all `(list @)`~ |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-search-all-fail-01
  %-  expect-fail
  |.  (search-all (limo ~[14]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-search-all-fail-02
  %-  expect-fail
  |.  (search-all (gulf [1 14]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-search-all-example-00
  %+  expect-eq
    !>  ~[15 30]
    !>  (search-all (gulf [1 30]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
::  +search-all-by-list
++  test-search-all-by-list-00
  %+  expect-eq
    !>  ~
    !>  (search-all-by-list `tape`~ "ba")
++  test-search-all-by-list-01
  %+  expect-eq
    !>  ~
    !>  (search-all-by-list "cbabab" `tape`~)
++  test-search-all-by-list-02
  %+  expect-eq
    !>  ~[0]
    !>  (search-all-by-list "b" "b")
++  test-search-all-by-list-03
  %+  expect-eq
    !>  ~[0]
    !>  (search-all-by-list "ba" "ba")
++  test-search-all-by-list-example-00
  %+  expect-eq
    !>  ~[1 3]
    !>  (search-all-by-list "cbabab" "ba")
::  +search-all-by-unit
++  test-search-all-by-unit-00
  %+  expect-eq
    !>  ~[2]
    !>  (search-all-by-unit (limo ~[2]) |=(a=@ ?:(=((mod a 2) 0) `a ~)))
++  test-search-all-by-unit-fail-00
  %-  expect-fail
  |.  (search-all-by-unit `(list @)`~ |=(a=@ ?:(=((mod a 2) 0) `a ~)))
++  test-search-all-by-unit-fail-01
  %-  expect-fail
  |.  (search-all-by-unit (limo ~[1]) |=(a=@ ?:(=((mod a 2) 0) `a ~)))
++  test-search-all-by-unit-example-00
  %+  expect-eq
    !>  ~[2 4]
    !>  (search-all-by-unit (limo ~[1 2 3 4]) |=(a=@ ?:(=((mod a 2) 0) `a ~)))
::  +search-back
++  test-search-back-00
  %+  expect-eq
    !>  15
    !>  (search-back (limo ~[15]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-search-back-fail-00
  %-  expect-fail
  |.  (search-back (limo ~) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-search-back-fail-01
  %-  expect-fail
  |.  (search-back (limo ~[14]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-search-back-fail-02
  %-  expect-fail
  |.  (search-back (gulf [1 14]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-search-back-example-00
  %+  expect-eq
    !>  30
    !>  (search-back (gulf [1 30]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
::  +search-back-by-list
++  test-search-back-by-list-00
  %+  expect-eq
    !>  0
    !>  (search-back-by-list "ba" "ba")
++  test-search-back-by-list-fail-00
  %-  expect-fail
  |.  (search-back-by-list "cbabab" ~)
++  test-search-back-by-list-fail-01
  %-  expect-fail
  |.  (search-back-by-list ~ "ba")
++  test-search-back-by-list-example-00
  %+  expect-eq
    !>  3
    !>  (search-back-by-list "cbabab" "ba")
::  +search-back-by-unit
++  test-search-back-by-unit-00
  %+  expect-eq
    !>  2
    !>  (search-back-by-unit (limo ~[2]) |=(a=@ ?:(=((mod a 2) 0) `a ~)))
++  test-search-back-by-unit-fail-00
  %-  expect-fail
  |.  (search-back-by-unit `(list @)`~ |=(a=@ ?:(=((mod a 2) 0) `a ~)))
++  test-search-back-by-unit-fail-01
  %-  expect-fail
  |.  (search-back-by-unit (limo ~[1]) |=(a=@ ?:(=((mod a 2) 0) `a ~)))
++  test-search-back-by-unit-example-00
  %+  expect-eq
    !>  4
    !>  (search-back-by-unit (limo ~[1 2 3 4]) |=(a=@ ?:(=((mod a 2) 0) `a ~)))
::  +search-index
++  test-search-index-00
  %+  expect-eq
    !>  0
    !>  (search-index (limo ~[15]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-search-index-fail-00
  %-  expect-fail
  |.  (search-index (limo ~) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-search-index-fail-01
  %-  expect-fail
  |.  (search-index (limo ~[14]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-search-index-fail-02
  %-  expect-fail
  |.  (search-index (gulf [1 14]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-search-index-example-00
  %+  expect-eq
    !>  14
    !>  (search-index (gulf [1 30]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
::  +search-by-list
++  test-search-by-list-00
  %+  expect-eq
    !>  0
    !>  (search-by-list `(list @)`~[1] `(list @)`~[1])
++  test-search-by-list-01
  %+  expect-eq
    !>  0
    !>  (search-by-list `(list @)`~[1 2] `(list @)`~[1 2])
++  test-search-by-list-02
  %+  expect-eq
    !>  3
    !>  (search-by-list `(list @)`~[1 2 3 4 5] `(list @)`~[4 5])
++  test-search-by-list-fail-00
  %-  expect-fail
  |.  (search-by-list `(list @)`~ `(list @)`~[2 3])
++  test-search-by-list-fail-01
  %-  expect-fail
  |.  (search-by-list `(list @)`~[1 2 3 4 5] `(list @)`~)
++  test-search-by-list-fail-02
  %-  expect-fail
  |.  (search-by-list `(list @)`~[1 2 3 4 5] `(list @)`~[4 6])
++  test-search-by-list-example-00
  %+  expect-eq
    !>  2
    !>  (search-by-list "cbabab" "ab")
::  +search-by-unit
++  test-search-by-unit-00
  %+  expect-eq
    !>  2
    !>  (search-by-unit (limo ~[2]) |=(a=@ ?:(=((mod a 2) 0) `a ~)))
++  test-search-by-unit-fail-00
  %-  expect-fail
  |.  (search-by-unit `(list @)`~ |=(a=@ ?:(=((mod a 2) 0) `a ~)))
++  test-search-by-unit-fail-01
  %-  expect-fail
  |.  (search-by-unit (limo ~[1]) |=(a=@ ?:(=((mod a 2) 0) `a ~)))
++  test-search-by-unit-example-00
  %+  expect-eq
    !>  2
    !>  (search-by-unit (limo ~[1 2 3 4]) |=(a=@ ?:(=((mod a 2) 0) `a ~)))
::  +search-index-all
++  test-search-index-all-00
  %+  expect-eq
    !>  ~
    !>  (search-index-all `(list @)`~ |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-search-index-all-01
  %+  expect-eq
    !>  ~
    !>  (search-index-all `(list @)`~[1] |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-search-index-all-02
  %+  expect-eq
    !>  ~[0]
    !>  (search-index-all `(list @)`~[15] |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-search-index-all-example-00
  %+  expect-eq
    !>  ~[14 29]
    !>  (search-index-all (gulf [1 30]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
::  +search-index-back
++  test-search-index-back-00
  %+  expect-eq
    !>  0
    !>  (search-index-back (limo ~[15]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-search-index-back-fail-00
  %-  expect-fail
  |.  (search-index-back (limo ~) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-search-index-back-fail-01
  %-  expect-fail
  |.  (search-index-back (limo ~[14]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-search-index-back-fail-02
  %-  expect-fail
  |.  (search-index-back (gulf [1 14]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-search-index-back-example-00
  %+  expect-eq
    !>  29
    !>  (search-index-back (gulf [1 30]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
::  +singleton
++  test-singleton-00
  %+  expect-eq
    !>  ~[~]
    !>  (singleton ~)
++  test-singleton-01
  %+  expect-eq
    !>  ~[23]
    !>  (singleton 23)
++  test-singleton-example-00
  %+  expect-eq
    !>  ~["tape"]
    !>  (singleton "tape")
::  +skip-n
++  test-skip-n-00
  %+  expect-eq
    !>  ~
    !>  (skip-n `(list @)`~ 0)
++  test-skip-n-01
  %+  expect-eq
    !>  ~[1]
    !>  (skip-n `(list @)`~[1] 0)
++  test-skip-n-02
  %+  expect-eq
    !>  ~
    !>  (skip-n `(list @)`~[1] 1)
++  test-skip-n-03
  %+  expect-eq
    !>  ~[2]
    !>  (skip-n `(list @)`~[1 2] 1)
++  test-skip-n-fail-00
  %-  expect-fail
  |.  (skip-n `(list @)`~ 1)
++  test-skip-n-fail-01
  %-  expect-fail
  |.  (skip-n `(list @)`~[1] 2)
++  test-skip-n-example-00
  %+  expect-eq
    !>  ~[3 4]
    !>  (skip-n `(list @)`[1 2 3 4 ~] 2)

::  +skip-while


::  +sort-by
++  test-sort-by-00
  %+  expect-eq
    !>  ~
    !>  (sort-by `(list tape)`~ |=(a=tape (lent a)))
++  test-sort-by-01
  %+  expect-eq
    !>  ~["a"]
    !>  (sort-by (limo ~["a"]) |=(a=tape (lent a)))
++  test-sort-by-02
  %+  expect-eq
    !>  ~["a" "bb"]
    !>  (sort-by (limo ~["bb" "a"]) |=(a=tape (lent a)))
++  test-sort-by-example-00
  %+  expect-eq
    !>  ~["a" "bb" "ccc" "dddd"]
    !>  (sort-by (limo ~["bb" "a" "dddd" "ccc"]) |=(a=tape (lent a)))
::  +sort-by-descending
++  test-sort-by-descending-00
  %+  expect-eq
    !>  ~
    !>  (sort-by-descending `(list tape)`~ |=(a=tape (lent a)))
++  test-sort-by-descending-01
  %+  expect-eq
    !>  ~["a"]
    !>  (sort-by-descending (limo ~["a"]) |=(a=tape (lent a)))
++  test-sort-by-descending-02
  %+  expect-eq
    !>  ~["bb" "a"]
    !>  (sort-by-descending (limo ~["a" "bb"]) |=(a=tape (lent a)))
++  test-sort-by-descending-example-00
  %+  expect-eq
    !>  ~["dddd" "ccc" "bb" "a"]
    !>  (sort-by-descending (limo ~["bb" "a" "dddd" "ccc"]) |=(a=tape (lent a)))
::  +sort-descending
++  test-sort-descending-00
  %+  expect-eq
    !>  ~
    !>  (sort-descending `(list @)`~)
++  test-sort-descending-01
  %+  expect-eq
    !>  ~[1]
    !>  (sort-descending (limo ~[1]))
++  test-sort-descending-02
  %+  expect-eq
    !>  ~["good" "bad"]
    !>  (sort-descending (limo ~["bad" "good"]))
++  test-sort-descending-example-00
  %+  expect-eq
    !>  ~[4 3 2 1]
    !>  (sort-descending (limo ~[4 2 1 3]))
::  +sort-qik
++  test-sort-qik-00
  %+  expect-eq
    !>  ~
    !>  (sort-qik `(list @)`~)
++  test-sort-qik-01
  %+  expect-eq
    !>  ~[1]
    !>  (sort-qik (limo ~[1]))
++  test-sort-qik-02
  %+  expect-eq
    !>  ~["bad" "good"]
    !>  (sort-qik (limo ~["good" "bad"]))
++  test-sort-qik-example-00
  %+  expect-eq
    !>  ~[1 2 3 4]
    !>  (sort-qik (limo ~[4 2 1 3]))
::  +split-at
++  test-split-at-00
  %+  expect-eq
    !>  [~ ~]
    !>  (split-at `(list)`~ 0)
++  test-split-at-01
  %+  expect-eq
    !>  [~ ~[1]]
    !>  (split-at (limo ~[1]) 0)
    ++  test-split-at-02
  %+  expect-eq
    !>  [~[1] ~]
    !>  (split-at (limo ~[1]) 1)
    ++  test-split-at-03
  %+  expect-eq
    !>  [~[1] ~[2]]
    !>  (split-at (limo ~[1 2]) 1)
++  test-split-at-example-00
  %+  expect-eq
    !>  [~[1 2] ~[3 4 5]]
    !>  (split-at (limo ~[1 2 3 4 5]) 2)

::  +split-into

::  +sum
++  test-sum-00
  %+  expect-eq
    !>  0
    !>  (sum `(list @)`~)
++  test-sum-01
  %+  expect-eq
    !>  1
    !>  (sum (limo ~[1]))
++  test-sum-02
  %+  expect-eq
    !>  0
    !>  (sum (limo ~[~ ~]))
++  test-sum-example-00
  %+  expect-eq
    !>  6
    !>  (sum (limo ~[1 2 3]))
::  +sum-by
++  test-sum-by-00
  %+  expect-eq
    !>  0
    !>  (sum-by `(list tape)`~ |=(a=tape (lent a)))
++  test-sum-by-01
  %+  expect-eq
    !>  1
    !>  (sum-by (limo ~["a"]) |=(a=tape (lent a)))
++  test-sum-by-example-00
  %+  expect-eq
    !>  6
    !>  (sum-by (limo ~["a" "bb" "ccc"]) |=(a=tape (lent a)))
::  +tail-end
++  test-tail-end-00
  %+  expect-eq
    !>  1
    !>  (tail-end ~[1])
++  test-tail-end-01
  %+  expect-eq
    !>  "b"
    !>  (tail-end ~["a" "b"])
++  test-tail-end-fail-00
  %-  expect-fail
  |.  (tail-end `(list)`~)
++  test-tail-end-example-00
  %+  expect-eq
    !>  3
    !>  (tail-end ~[1 2 3])
::
::  +take-while
::  +transpose

::  +try-exactly-one
++  test-try-exactly-one-00
  %+  expect-eq
    !>  ~
    !>  (try-exactly-one (limo ~))
++  test-try-exactly-one-01
  %+  expect-eq
    !>  ~
    !>  (try-exactly-one (limo ~["tape" ""]))
++  test-try-exactly-one-example-00
  %+  expect-eq
    !>  `"tape"
    !>  (try-exactly-one (limo ~["tape"]))
::  +try-head
++  test-try-head-00
  %+  expect-eq
    !>  `1
    !>  (try-head ~[1])
++  test-try-head-01
  %+  expect-eq
    !>  ~
    !>  (try-head ~)
++  test-try-head-example-00
  %+  expect-eq
    !>  `1
    !>  (try-head ~[1 2])
::  +try-item
++  test-try-item-00
  %+  expect-eq
    !>  [~ "aa"]
    !>  (try-item `(list tape)`~["aa"] 0)
++  test-try-item-01
  %+  expect-eq
    !>  [~ "aa"]
    !>  (try-item `(list tape)`~["aa" "bb"] 0)
++  test-try-item-02
  %+  expect-eq
    !>  [~ "bb"]
    !>  (try-item `(list tape)`~["aa" "bb"] 1)
++  test-try-item-03
  %+  expect-eq
    !>  ~
    !>  (try-item `(list tape)`~ 0)
++  test-try-item-example-00
  %+  expect-eq
    !>  [~ "cc"]
    !>  (try-item `(list tape)`~["aa" "bb" "cc" "dd"] 2)
++  test-try-item-example-01
  %+  expect-eq
    !>  ~
    !>  (try-item `(list tape)`~["aa" "bb"] 2)
::  +try-remove-at
++  test-try-remove-at-00
  %+  expect-eq
    !>  [~ ~]
    !>  (try-remove-at (limo ~[1]) 0)
++  test-try-remove-at-01
  %+  expect-eq
    !>  [~ ~[2]]
    !>  (try-remove-at `(list @)`[1 2 ~] 0)
++  test-try-remove-at-02
   %+  expect-eq
    !>  [~ ~[1]]
    !>  (try-remove-at `(list @)`[1 2 ~] 1)
++  test-try-remove-at-03
  %+  expect-eq
    !>  ~
    !>  (try-remove-at ~ 0)
++  test-try-remove-at-04
  %+  expect-eq
    !>  ~
    !>  (try-remove-at (limo ~[1]) 1)
++  test-try-remove-at-example-00
  %+  expect-eq
    !>  [~ "good day urbit!"]
    !>  (try-remove-at "good day, urbit!" 8)
++  test-try-remove-at-example-01
  %+  expect-eq
    !>  [~ ~[1 2 4]]
    !>  (try-remove-at `(list @)`[1 2 3 4 ~] 2)
::  +try-remove-many-at
++  test-try-remove-many-at-00
  %+  expect-eq
    !>  [~ ~]
    !>  (try-remove-many-at ~ [0 0])
++  test-try-remove-many-at-02
  %+  expect-eq
    !>  [~ ~[1]]
    !>  (try-remove-many-at (limo ~[1]) [0 0])
++  test-try-remove-many-at-03
  %+  expect-eq
    !>  [~ ~[1]]
    !>  (try-remove-many-at (limo ~[1]) [1 0])
++  test-try-remove-many-at-04
  %+  expect-eq
    !>  [~ ~]
    !>  (try-remove-many-at (limo ~[1]) [0 1])
++  test-try-remove-many-at-05
   %+  expect-eq
    !>  [~ ~[1 2 5]]
    !>  (try-remove-many-at `(list @)`[1 2 3 4 5 ~] [2 2])
++  test-try-remove-many-at-06
  %+  expect-eq
    !>  [~ ~[1 2 3 4 5]]
    !>  (try-remove-many-at `(list @)`[1 2 3 4 5 ~] [2 0])
++  test-try-remove-many-at-07
  %+  expect-eq
    !>  ~
    !>  (try-remove-many-at ~ [0 1])
++  test-try-remove-many-at-08
  %+  expect-eq
    !>  ~
    !>  (try-remove-many-at ~ [1 0])
++  test-try-remove-many-at-09
  %+  expect-eq
    !>  ~
    !>  (try-remove-many-at (limo ~[1]) [0 2])
++  test-try-remove-many-at-example-00
  %+  expect-eq
    !>  [~ "good urbit!"]
    !>  (try-remove-many-at "good day, urbit!" [4 5])
++  test-try-remove-many-at-example-01
  %+  expect-eq
    !>  [~ ~[1 2]]
    !>  (try-remove-many-at `(list @)`[1 2 3 4 ~] [2 2])
::  +try-search
++  test-try-search-00
  %+  expect-eq
    !>  `15
    !>  (try-search (limo ~[15]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-try-search-01
  %+  expect-eq
    !>  ~
    !>  (try-search (limo ~) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-try-search-02
  %+  expect-eq
    !>  ~
    !>  (try-search (limo ~[14]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-try-search-03
  %+  expect-eq
    !>  ~
    !>  (try-search (gulf [1 14]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-try-search-example-00
  %+  expect-eq
    !>  `15
    !>  (try-search (gulf [1 30]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
::  +try-search-back
++  test-try-search-back-00
  %+  expect-eq
    !>  `15
    !>  (try-search-back (limo ~[15]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-try-search-back-01
  %+  expect-eq
    !>  ~
    !>  (try-search-back (limo ~) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-try-search-back-02
  %+  expect-eq
    !>  ~
    !>  (try-search-back (limo ~[14]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-try-search-back-03
  %+  expect-eq
    !>  ~
    !>  (try-search-back (gulf [1 14]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-try-search-back-example-00
  %+  expect-eq
    !>  `30
    !>  (try-search-back (gulf [1 30]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
::  +try-search-by-unit
++  test-try-search-by-unit-00
  %+  expect-eq
    !>  `2
    !>  (try-search-by-unit (limo ~[2]) |=(a=@ ?:(=((mod a 2) 0) `a ~)))
++  test-try-search-by-unit-01
  %+  expect-eq
    !>  ~
    !>  (try-search-by-unit `(list @)`~ |=(a=@ ?:(=((mod a 2) 0) `a ~)))
++  test-try-search-by-unit-02
  %+  expect-eq
    !>  ~
    !>  (try-search-by-unit (limo ~[1]) |=(a=@ ?:(=((mod a 2) 0) `a ~)))
++  test-try-search-by-unit-example-00
  %+  expect-eq
    !>  `2
    !>  (try-search-by-unit (limo ~[1 2 3 4]) |=(a=@ ?:(=((mod a 2) 0) `a ~)))
++  test-try-search-by-unit-example-01
  %+  expect-eq
    !>  ~
    !>  (try-search-by-unit (limo ~[1 3]) |=(a=@ ?:(=((mod a 2) 0) `a ~)))
::  +try-search-index
++  test-try-search-index-00
  %+  expect-eq
    !>  `0
    !>  (try-search-index (limo ~[15]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-try-search-index-01
  %+  expect-eq
    !>  ~
    !>  (try-search-index (limo ~) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-try-search-index-02
  %+  expect-eq
    !>  ~
    !>  (try-search-index (limo ~[14]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-try-search-index-03
  %+  expect-eq
    !>  ~
    !>  (try-search-index (gulf [1 14]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-try-search-index-example-00
  %+  expect-eq
    !>  `14
    !>  (try-search-index (gulf [1 30]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
::  +try-search-index-back
++  test-try-search-index-back-00
  %+  expect-eq
    !>  `0
    !>  (try-search-index-back (limo ~[15]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-try-search-index-back-01
  %+  expect-eq
    !>  ~
    !>  (try-search-index-back (limo ~) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-try-search-index-back-02
  %+  expect-eq
    !>  ~
    !>  (try-search-index-back (limo ~[14]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-try-search-index-back-03
  %+  expect-eq
    !>  ~
    !>  (try-search-index-back (gulf [1 14]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
++  test-try-search-index-back-example-00
  %+  expect-eq
    !>  `29
    !>  (try-search-index-back (gulf [1 30]) |=(a=@ud ?&(=(0 (mod a 3)) =(0 (mod a 5)))))
::  +try-tail
++  test-try-tail-00
  %+  expect-eq
    !>  `~
    !>  (try-tail ~[1])
++  test-try-tail-01
  %+  expect-eq
    !>  ~
    !>  (try-tail ~)
++  test-try-tail-example-00
  %+  expect-eq
    !>  `~[2]
    !>  (try-tail ~[1 2])
::  +try-tail-end
++  test-try-tail-end-00
  %+  expect-eq
    !>  `1
    !>  (try-tail-end ~[1])
++  test-try-tail-end-01
  %+  expect-eq
    !>  `"b"
    !>  (try-tail-end ~["a" "b"])
++  test-try-tail-end-02
  %+  expect-eq
    !>  ~
    !>  (try-tail-end `(list)`~)
++  test-try-tail-end-example-00
  %+  expect-eq
    !>  `3
    !>  (try-tail-end ~[1 2 3])
::  +try-update-at
++  test-try-update-at-00
  %+  expect-eq
    !>  [~ ~[11]]
    !>  (try-update-at (limo ~[1]) 0 11)
++  test-try-update-at-01
  %+  expect-eq
    !>  ~
    !>  (try-update-at `(list @)`~ 0 11)
++  test-try-update-at-example-00
  %+  expect-eq
    !>  [~ ~[2 11 4]]
    !>  (try-update-at (limo ~[2 3 4]) 1 11)
++  test-try-update-at-example-01
  %+  expect-eq
    !>  ~
    !>  (try-update-at (limo ~[2 3 4]) 3 11)

::  +unfold

::  +unzip
++  test-unzip-00
  %+  expect-eq
    !>  [~ ~]
    !>  (unzip ~)
++  test-unzip-01
  %+  expect-eq
    !>  [~[1] ~["aa"]]
    !>  (unzip (limo ~[[1 "aa"]]))
++  test-unzip-example-00
  %+  expect-eq
    !>  [~[1 2] ~["aa" "bb"]]
    !>  (unzip (limo ~[[1 "aa"] [2 "bb"]]))
::  +unzip3
++  test-unzip3-00
  %+  expect-eq
    !>  [~ ~ ~]
    !>  (unzip3 ~)
++  test-unzip3-01
  %+  expect-eq
    !>  [~[1] ~["aa"] ~['a']]
    !>  (unzip3 (limo ~[[1 "aa" 'a']]))
++  test-unzip3-example-00
  %+  expect-eq
    !>  [~[1 2] ~["aa" "bb"] ~['a' 'b']]
    !>  (unzip3 (limo ~[[1 "aa" 'a'] [2 "bb" 'b']]))
::  +update-at
++  test-update-at-00
  %+  expect-eq
    !>  ~[11]
    !>  (update-at (limo ~[1]) 0 11)
++  test-update-at-fail-00
  %-  expect-fail
  |.  (update-at `(list @)`~ 0 11)
++  test-update-at-fail-01
  %-  expect-fail
  |.  (update-at (limo ~[2 3 4]) 3 11)
++  test-update-at-example-00
  %+  expect-eq
    !>  ~[2 11 4]
    !>  (update-at (limo ~[2 3 4]) 1 11)
::  +where
++  test-where-00
  %+  expect-eq
    !>  ~
    !>  (where `(list @)`~ |=(a=@ ?:(=(0 (mod a 2)) %.y %.n)))
++  test-where-01
  %+  expect-eq
    !>  ~[2]
    !>  (where (limo ~[2]) |=(a=@ ?:(=(0 (mod a 2)) %.y %.n)))
++  test-where-02
  %+  expect-eq
    !>  ~
    !>  (where (limo ~[1]) |=(a=@ ?:(=(0 (mod a 2)) %.y %.n)))
++  test-where-example-00
  %+  expect-eq
    !>  ~[2 8]
    !>  (where (limo ~[2 1 8]) |=(a=@ ?:(=(0 (mod a 2)) %.y %.n)))
::  +windowed
++  test-windowed-00
  %+  expect-eq
    !>  ~[~[1]]
    !>  (windowed (limo ~[1]) 1)
++  test-windowed-01
  %+  expect-eq
    !>  ~[~[1] ~[2]]
    !>  (windowed (limo ~[1 2]) 1)
++  test-windowed-fail-00
  %-  expect-fail
  |.  (windowed `(list @)`~ 3)
++  test-windowed-fail-01
  %-  expect-fail
  |.  (windowed (limo ~[1]) 3)
++  test-windowed-fail-02
  %-  expect-fail
  |.  (windowed (limo ~[1 2]) 3)
++  test-windowed-example-00
  %+  expect-eq
    !>  ~[~[1 2 3] ~[2 3 4] ~[3 4 5]]
    !>  (windowed (limo ~[1 2 3 4 5]) 3)
::  +zip
++  test-zip-00
  %+  expect-eq
    !>  ~
    !>  (zip `(list @)`~ `(list @)`~)
++  test-zip-01
  %+  expect-eq
    !>  ~[[1 "aa"]]
    !>  (zip `(list @)`~[1] `(list tape)`~["aa"])
++  test-zip-fail-00
  %-  expect-fail
  |.  (zip `(list @)`~[1 2] `(list tape)`~["aa"])
++  test-zip-fail-01
  %-  expect-fail
  |.  (zip `(list @)`~[1] `(list tape)`~["aa" "bb"])
++  test-zip-example-00
  %+  expect-eq
    !>  ~[[1 "aa"] [2 "bb"]]
    !>  (zip `(list @)`~[1 2] `(list tape)`~["aa" "bb"])
::  +zip3
++  test-zip3-00
  %+  expect-eq
    !>  ~
    !>  (zip3 `(list @)`~ `(list @)`~ `(list @)`~)
++  test-zip3-01
  %+  expect-eq
    !>  ~[[1 "aa" 'a']]
    !>  (zip3 `(list @)`~[1] `(list tape)`~["aa"] `(list @t)`~['a'])
++  test-zip3-fail-00
  %-  expect-fail
  |.  (zip3 `(list @)`~[1 2] `(list tape)`~["aa" "bb"] `(list @t)`~['a'])
++  test-zip3-fail-01
  %-  expect-fail
  |.  (zip3 `(list @)`~[1] `(list tape)`~["aa" "bb"] `(list @t)`~['a' 'b'])
++  test-zip3-fail-02
  %-  expect-fail
  |.  (zip3 `(list @)`~[1 2] `(list tape)`~["aa"] `(list @t)`~['a' 'b'])
++  test-zip3-example-00
  %+  expect-eq
    !>  ~[[1 "aa" 'a'] [2 "bb" 'b']]
    !>  (zip3 `(list @)`~[1 2] `(list tape)`~["aa" "bb"] `(list @t)`~['a' 'b'])
--
