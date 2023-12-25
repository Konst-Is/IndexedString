# IndexedString - an extension to String that allows you to use an integer subscript 

A string in Swift is a collection of extended grapheme clusters, each of which forms one human-readable character. 
In turn, each extended grapheme cluster is a collection of Unicode scalar values.

If a single character or grapheme cluster consisted of a single Unicode scalar value, then the String type would have a subscript that accepts an integer index. But since this collection may contain several Unicode scalar values that are combined with each other, there are situations when using an integer subscript may cause errors.

For this reason, the standard String type in Swift has a subscript that takes the String.Index type instead of Int. In order to access a character in a string by such an index, you have to write cumbersome and inconvenient constructions.

IndexedString is a Swift Package which contains an extension to String, and which will make your work with String more convenient. You will get the ability to use integer subscript. As a result, operations like cut, delete, replace part of a string are performed very conveniently. In addition, visual presentation of a collection of extended grapheme clusters in String is implemented.
