* Default Arguments In Enum Cases
 
enumのAssociated Valuesにデフォルト値を設定できるようになった

[【Swift】Swift5.1からenumのAssociated Valuesにデフォルト値を設定できるようになった](https://qiita.com/shiz/items/30fc7d3ff78fefbb3a40?utm_campaign=popular_items&utm_medium=feed&utm_source=popular_items)

* Synthesize default values for the memberwise initializer

以前のSwiftのバージョン(Swift 5.0以前のバージョン)では, 値がデフォルトかそうでないかに関わらず、Struct内にすべてのパラメータを設定する必要がありました。  
memberwise initializerはStructのプロパティにマッチするするように自動的に作成されます。  
Swift 5.1では、memberwise initializerはすべてのプロパティにデフォルトのパラメータの値が設定されます。

* 単一式からの暗黙的な”return”

Swift 5.1では、もしfunctionが単一式または単一の値から判断されるステートメントであれば、returnを削除することができます。

* Expanding Swift Self to class members and value types

前回のSwiftバージョンではSelf キーワードが実際の具体的な型が不明なコンテキストで型を動的に参照できました。  
Swfit5.1のSelfのスコープはenum、 struct、classのような具体的な型も含まれるようになりました。

* Warnings for ambiguous none cases

Swiftのオプショナルは2つのenumが値の存在があるものと”none”の状態で設定されるとします。  
Swift 5.1この混乱に対して警告を表示します。“

* Matching optional enums against non-optionals

SwiftはStringとIntegerではoptionalと非optionalの間でswitch/caseを適切に行ってます。しかし、Swift5.1の前はenumは拡張されていませんでした。

* [Swift 5.1 Released!](https://swift.org/blog/swift-5-1-released/)
* [IOS PROGRAMMING: NEW UPDATES IN SWIFT 5.1](http://vietnam.briswell.com/ja/news/swift5-1-updates/)
* [5 small but significant improvements in Swift 5.1](https://www.swiftbysundell.com/articles/5-small-but-significant-improvements-in-swift-5-1/)
* [What’s new in Swift 5.1](https://www.hackingwithswift.com/articles/182/whats-new-in-swift-5-1)
* [Swift 5.1がリリース、モジュール安定性、Opaque Return Type、Property Wrapperなどを提供](https://www.infoq.com/jp/news/2019/12/swift-51-module-stability/)

### Ordered Collection Diffing

* [Swift5.1から使えるOrdered Collection Diffingについて](https://dev.classmethod.jp/etc/introduce-ordered-collection-diffing/)
* [Ordered Collection Diffing入門](https://qiita.com/shiz/items/0e363219a0151d790d03)


### Property Wrappers

#### Property wrapper types

* [Property Wrappers](https://github.com/apple/swift-evolution/blob/master/proposals/0258-property-wrappers.md)
* [SwiftUI Property WrappersクラスのwrappedValue・projectedValue一覧表](https://qiita.com/crea/items/0b59722ab21e8c6cbb30)
* [SwiftUIのProperty Wrappersとデータへのアクセス方法](https://qiita.com/shiz/items/6eaf87fa79499623306a)

A property wrapper type is a type that can be used as a property wrapper. There are two basic requirements for a property wrapper type:

1. The property wrapper type must be defined with the attribute @propertyWrapper. The attribute indicates that the type is meant to be used as a property wrapper type, and provides a point at which the compiler can verify any other consistency rules.
2. The property wrapper type must have a property named wrappedValue, whose access level is the same as that of the type itself. This is the property used by the compiler to access the underlying value on the wrapper instance.

-------

[Property wrappers in Swift](https://www.swiftbysundell.com/articles/property-wrappers-in-swift/)


値が変更されるたびにそれをトリガーに何らかの関連ロジックを実行する。  
例えば一連のルールに従って新しい値を検証したり、割り当てられた値を何らかの方法で変換したり、値が変更された時にオブザーバーに通知したり。  
そのような振る舞いを再利用できるようにする。

### Transparently wrapping a value（値を透過的にラップする）
プロパティラッパーは追加のロジックを付加するために特定の値をラップするタイプです。
@propertyWrapper属性で注釈を付けることにより、構造体またはクラスを使用して実装できます。

利用するための要件は各プロパティラッパータイプに`wrappedValue`という名前のストアドプロパティが含まれていること。

プロパティオブザーバーは値またはオブジェクトが完全に初期化された後にのみトリガーされる。

プロパティラッパーが`init(wrappedValue:)`を定義しているときはラップされたプロパティにデフォルト値を割り当てられる。

