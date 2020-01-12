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