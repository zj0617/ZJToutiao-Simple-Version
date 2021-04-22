# ZJToutiao-Simple-Version

```
2021年三月初开始自学了Objective-C的相关语法，四月初大致完成了基本语法的学习。
尝试设计了一个较为简单的App，整个设计还是比较简单粗糙的，功能的完善以及后端的搭建还有待进一步完成。
```


## 运用到的知识

这里做一个用到的知识汇总，方便查看。


#### 严格控制开放接口

- **类扩展**

  写在.h声明里面的都是对外开放的接口。

  在继承UIViewController，自定义UITabBarController的子控制器时，子控制器涉及表格视图、输入框、按钮、图片的显示，因此需要定义相关类型的属性。将只是该类或者是该类实例才需要使用的属性或者方法在类扩展中声明，从而实现隐藏。

- **属性特性**

  除了函数之外，特别要注意@property默认属性为readwrite，相当于开放setter、getter，我们需要特别留意setter，是否需要对外开放，如果不需要对外开放我们应该使用readonly。

  例子：

  HistoryRecorder开放给外部的接口是：

  **@property** (**nonatomic**, **strong**, **readonly**) NSArray *records;

  外部只读，但是不可以更改；


#### 单例

涉及显示浏览历史记录的功能，自定义单例负责保存浏览记录信息，涉及增加浏览记录、返回浏览记录操作。

一旦创建了单例类的实例，那么其他对象都与此实例进行通信，从而保证了全局一致性。

**建立单例的原因：**

历史记录考虑过不设置单例，直接发通知给业务方，但是考虑到有些需要使用历史记录业务可能在发通知的时候还没被创建，导致历史记录遗漏，所以还是做了一个单例。


#### copy & mutableCopy

自定义单例HistoryRecorder类用以记录浏览历史，供全局使用。

HistoryRecorder中，内部维护的数组是：

**@property** (**nonatomic**, **strong**) NSMutableArray *internalRecords;

而对外开放的是：

**@property** (**nonatomic**, **strong**, **readonly**) NSArray *records;

覆盖records的getter，这里需要返回copy，不可变数组。这样做也可以避免外部修改HistoryRecorder维护的数组。

实际的增加记录操作是对于内部的NSMutableArray类型对象操作的；

我覆盖对外可见的NSArray对象的取方法，每次获取其值时，都发送copy消息给类扩展中的NSMutableArray类型的属性对应的实例，返回一个不可修改的NSArray实例；


#### 页面结构设置

1. TabbarController装NavigationController

   每个Tab有自己的NavigationController，pushController的时候Tabbar会盖在上面

2. NavigationController装TabbarController

   只有一个共用NavigationController，pushController的时候Tabbar不会盖在上面。

视场景使用上述两种方案。


#### UITableView&UIControllerView

两者都适用于做Feed流（Feed流是持续更新并呈现给用户内容的信息流)，CollectionView可以采用流式布局，更多样化一些。



## TODO

HistoryRecorder的addRecord：接口实现时使用内部线程解决多线程问题。多线程语法还没学到。







