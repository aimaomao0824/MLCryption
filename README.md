# MLCryption

---

- 简单好用的加密、解密工具框架「目前支持AES、DES、3DES、CAST、RC4、RC2、Blowfish」

  GitHub：[Mannners](https://github.com/limao0824) ｜ 简书：[爱貌貌Manners](https://www.jianshu.com/u/2a30a84c7dbc) ｜ [邮件反馈](mailto:limao0824@163.com)

---

## 目录 

* [一、MLCryption介绍](#Getting_Started)
   * [1.1 能做什么](#Features)
   * [1.2 怎么安装](#Installation)
* [二、单个加密器使用示例代码](#Examples)
   * [DES加密](#JSON_Model)
   * [3DES加密](#JSONString_Model)
   * [AES128加密](#Model_contains_model)
   * [CAST加密](#Model_contains_model_array)
   * [RC2加密](#Model_name_JSON_key_mapping)
  * [Blowfish加密](#JSON_array_model_array)
* [三、通用加密器使用示例代码](#Examples)
  * [CBC-PK7模式通用加密器使用](#JSON_Model)
  * [多参数多模式设置加密器使用](#JSONString_Model)

---

# <a id="Getting_Started"></a> Getting Started【一、MLCryption介绍]】

## <a id="Features"></a> Features【1.1 能做什么】
- MJExtension是一套字典和模型之间互相转换的超轻量级框架
* 只需要一行代码，就能实现模型的所有属性进行Coding（归档和解档）

## <a id="Installation"></a> Installation【1.2 安装使用】

### 1) 使用CocoaPods安装

```ruby
pod 'MLCryption'
```

### 2)手动导入安装
- 将`MLCryption `文件夹中的所有源代码拽入项目中
- 导入主头文件：`#import "MLCryption.h"`