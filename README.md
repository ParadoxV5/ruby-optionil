This is an extremely simplistic (lol, only the 4 essential files) library that adds the Optional (anti)[^A] design pattern too ALL methods globally.
It even supports [logic operators (`and`, `or`, etc.)](#logic-operation)!


## Synopsis
```ruby
some = Optionil[42]        #=> Optionil::Some[42]
none = Optionil[nil]       #=> Optionil::None[] (you don't want Optionil::Some[nil], do you?…)
       Optionil::Some[nil] #!> NoMatchingPatternError (Do you???)
none.equal? Optionil[]     #=> true (the two are equivalent and all calls give the same constant)

Optionil::Some[]    #!> wrong number of arguments (given 0, expected 1) (ArgumentError)
Optionil::None[nil] #!> wrong number of arguments (given 1, expected 0) (ArgumentError)
```

### Accessing
```ruby
some.value #=> some
none.value #=> nil

some.value! #=> 42
none.value! #!> NoMatchingPatternError

some.value {      0      } # => some
some.value {    raise    } # => some
none.value {      0      } # => 0
none.value { Optionil[0] } # => Optionil::Some[0]

some.each {|n|     -n       } #=> -42
some.each {|n| Optionil[-n] } #=> Optionil::Some[-42]
none.each {|n|     -n       } #=> nil
none.each {|n|   raise      } #=> nil
```

### Pattern Matching
```ruby
Optionil       === some #=> true
Optionil       === none #=> true
Optionil::Some === some #=> true
Optionil::Some === none #=> false
Optionil::None === some #=> false
Optionil::None === none #=> true

some.some? #=> true
none.some? #=> false
some.none? #=> false
none.none? #=> true

some.some? Integer #=> true
some.some? String  #=> false
none.some? Integer #=> false

some.some? &:even? #=> true
some.some? &:odd?  #=> false
some.none? &:even? #=> false
some.none? &:odd?  #=> true
```

### Logic Operation
```ruby
!some #=> false
!none #=> true

som2 = Optionil::Some[-69]

some and som2 #=> som2
some and none #=> none
none and som2 #=> none

some or som2 #=> some
some or none #=> some
none or som2 #=> som2
none or none #=> none

som0 = Optional::Some[false]
!som0 #=> true
som0 and some #=> som0
# applies to `Optional::Some[nil]` as well
```

### Method chaining
I’m intentionally *not* supporting this.
Please tune in to pipeine operator discussions instead, such as https://bugs.ruby-lang.org/issues/20770.


## License
Copyright © 2024 ParadoxV5

I made this little joke as entertainment in a day.
I release it to the public domain; you can redistribute it and/or modify it under the “terms” of the
[Do What The Fuck You Want To Public License, Version 2](http://www.wtfpl.net/).

[^A]: Cold take: the Optional pattern only exists because you can’t properlly handle `nil`s.
    
    Yes, `null` is a billion-dollar mistake in traditional languages; but this is Ruby – we don’t have `null`s, we have `nil`s!
    A `String` can never be `nil`, only a `String?` (RBS) can!
    
    Even for, say Java, `NonNull` exists
    ([JetBrains](https://www.jetbrains.com/help/idea/annotating-source-code.html#nullability-annotations),
    [Android](https://developer.android.com/reference/androidx/annotation/NonNull),
    [Lombok](https://projectlombok.org/features/NonNull)),
    so nullable variables are already `Some|None` Schrödinger boxes, why bother adding `Option` as another layer of wrapper?
    You’d think `Optional[T]?` wouldn’t be a thing? Do you need `Optional[Optional[T]]` for that?
    JavaScript already has both `null` and `undefined`, questionably, yet how many *more* types of `nil`s do you still need?
