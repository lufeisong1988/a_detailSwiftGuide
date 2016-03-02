##Swift快速入门指南
####swift的对象方法和类方法,重写方法和构造方法
- swift 用 func 来创建方法(swift 是函数式编程, 我也不知道该称它是方法, 还是函数, 傻傻分不清啊, 这货长得就像我们映像中的函数样啊...沿用 OC, 就叫方法吧)
	- 注意, swift方法可以同名, 前提是参数不能相同, 取名困难者可以聊表安慰了
- 对象方法:
	- fun表示创建方法
	- private表示私有, 只有在当前文件中才能调用
		- 加了 private 关键字的函数, 用 Selector 来包装方法的时候, 必须要在 private 前加@ objc, 表示把方法加入到方法列表, 不然会报找不到的错误

```
	    @objc private func leftItemClick() {
        print("leftItemClick")
    }

```
	
- 2.类方法 ,只需要在对象方法 func 前面加上 class 就表示类方法  

```
    class func visitorView() -> VisitorView {
        return NSBundle.mainBundle().loadNibNamed("VisitorView", owner: nil, options: nil).first as! VisitorView
    }
```
- 3.自定义构造方法
	- override: 表示重写父类方法, 系统会默认帮我们调用 super.init()
	- 自定义构造方法, 加入自己想初始化摄者的属性即可
	- 注意:如果自定了构造方法, 并且没有重写默认构造方法, 那么系统默认的构造方法就会失效(也就是我下面代码, 你如果再调用 init(), 是会报错的)


```
 //   override init() {
 //       name = "jinxiaofei"
 //       age = 24
        // 注意, 系统默认会帮我们调用 super.init()
 //   }
    
    // 自定义构造方法
    init(name : String, age: Int)
    {
        self.name = name 
        self.age = age
    }
```

- 2.重写initWithFrame
	- super: 同 OC一样
	- 注意下面代码, 在 swift 中如果重写了 initWithFrame, 必须重写init?(coder aDecoder

```
    // MARK:- 构造方法
    override init(frame: CGRect) {
        super.init(frame: frame)
     }
    
    // Swift中如果重写了控件的initWithFrame方法,必须重写init?(coder aDecoder
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- 系统回调的方法
    override func layoutSubviews() {
        super.layoutSubviews()
```
- 3.遍历构造方法
	- 相当于 OC 的自定义构造方法
	- 必须加convenience关键字
	- swift的 init 不需要返回自己, 系统帮我们做了, 看方法, 他并没有返回值, 但我们必须调用 self.init(), 这样自己才有值, 才能给自己 设置初始化属性

```
extension UIBarButtonItem {
    // 便利构造函数
    convenience init(imageName : String, target : AnyObject?, action : Selector) {
        let btn = UIButton(type: .Custom)
        // ...与自己非相关设置
        self.init(customView : btn)
        // ...与自己相关设置
    }
}

```

####swift创建单例
- static + let 就可以设计单例

```
    static let shareIntance : NetworkTools = NetworkTools(baseURL: nil)
```


####全局函数
- Swift支持全局方法, 全局方法可以在当前所在的命名空间下随意调用, 以自定义的print方法为例(扩充打印内容, 更友好的提示打印内容的所在位置)
	- 定义全局方法类似定义全局变量, 可以在任意控制器下的大括号外定义即可

 ```
func XMGLog<T>(message : T, file : String = __FILE__, funcName : String = __FUNCTION__, lineNum : Int = __LINE__) {
    
    #if DEBUG
    
    // 1.对文件进行处理
    let fileName = (file as NSString).lastPathComponent
    
    // 2.打印内容
    print("[\(fileName)][\(funcName)](\(lineNum)):\(message)")
    
    #endif
}
```