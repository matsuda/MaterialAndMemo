* [Combine](https://developer.apple.com/documentation/combine)
* [RxSwift to Apple’s Combine “Cheat Sheet”](https://medium.com/gett-engineering/rxswift-to-apples-combine-cheat-sheet-e9ce32b14c5b)
* [【iOS】Combineフレームワークまとめ](https://qiita.com/shiz/items/5efac86479db77a52ccc)

## Combine

> The Combine framework provides a declarative Swift API for processing values over time. These values can represent many kinds of asynchronous events. Combine declares publishers to expose values that can change over time, and subscribers to receive those values from the publishers.
> 
> Combineフレームワークは、時間の経過とともに値を処理するための宣言型Swift APIを提供します。 これらの値は、多くの種類の非同期イベントを表すことができます。 Combineは、時間の経過とともに変化する可能性のある値を公開するパブリッシャーと、パブリッシャーからそれらの値を受け取るサブスクライバーを宣言します。

いくつかのFoundationタイプは、パブリッシャーを通じて機能を公開しています

* Timer
* NotificationCenter
* URLSession

Combineは、Key-Value Observingに準拠するすべてのプロパティに組み込みのパブリッシャーを提供します。


## Publisher

> The Publisher protocol declares a type that can deliver a sequence of values over time. Publishers have operators to act on the values received from upstream publishers and republish them.
> 
> Publisherプロトコルは、時間の経過とともに一連の値を配信できる型を宣言します。 Publisherには、上流のPublisherから受け取った値に基づいて行動し、それらを再公開するオペレーターがいます。
> 
> 
> Declares that a type can transmit a sequence of values over time.
>
> A publisher delivers elements to one or more Subscriber instances. 

> 型が時間の経過とともに一連の値を送信できるもの
>
> 一つ以上のSubscriberに要素を配信する

## Subscriber

> At the end of a chain of publishers, a Subscriber acts on elements as it receives them. Publishers only emit values when explicitly requested to do so by subscribers. This puts your subscriber code in control of how fast it receives events from the publishers it’s connected to.
> 
> パブリッシャーのチェーンの終わりに、サブスクライバーはエレメントを受け取ったときにエレメントに作用します。 パブリッシャーは、サブスクライバーから明示的に要求された場合にのみ値を発行します。 これにより、サブスクライバーコードは、接続しているパブリッシャーからイベントを受信する速度を制御します。
> 
> 
> A protocol that declares a type that can receive input from a publisher.
>
> A Subscriber instance receives a stream of elements from a Publisher, along with life cycle events describing changes to their relationship. 

> Publisherから入力を受け取ることができるもの
>
> Subscriberは、変更されたライフサイクルのイベントと共に、Publisherから要素を受け取る

## Operators

> Each part of the chain is a Combine operator that performs a distinct action on the elements received from the previous step.

> チェーンの各部分は、前の手順から受け取った要素に対して個別のアクションを実行する結合演算子です。

## Convenience Publishers

### Future

> A publisher that eventually produces a single value and then finishes or fails.
> 
> 一回だけ要素を配信して終了、またはエラーを配信する

### Just

> A publisher that emits an output to each subscriber just once, and then finishes.
> 
> 必ず一回だけ要素を配信して終了する。エラーにならない。

### Empty

> A publisher that never publishes any values, and optionally finishes immediately.
> 
> 要素を配信しない。

### Fail

> A publisher that immediately terminates with the specified error.
> 
> 指定されたエラーを配信して終了する

## Subjects


### CurrentValueSubject

> A subject that wraps a single value and publishes a new element whenever the value changes.
> 
> CurrentValueSubject maintains a buffer of the most recently published element.
> 
> 単一の値をラップし、値が変更されるたびに新しい要素を配信する
> 
> 最後に配信された要素のバッファを保持する

### PassthroughSubject

> A subject that broadcasts elements to downstream subscribers.
> 
> a PassthroughSubject doesn’t have an initial value or a buffer of the most recently-published element. 
> 
> 後方へ要素を配信する
> 
> 初期値も最後に配信された要素のバッファも持たない


## Publishers

### Published

> Publishing a property with the @Published attribute creates a publisher of this type. 
> 
> @Published属性でプロパティを公開するとこの型のPublisherが作成される

## RxSwift


|RxSwift|Combine|
|:-:|:-:|

