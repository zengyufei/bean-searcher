---
description: Bean Searcher
---

# 起步

> 如果您还没有阅读 [介绍 > 为什么用](/guide/latest/introduction.html#为什么用) 章节，建议先阅读它们。

## 安装

### Maven

```xml
<!-- Bean Searcher 核心依赖，任何框架都可使用该依赖 -->
<dependency>
    <groupId>cn.zhxu</groupId>
    <artifactId>bean-searcher</artifactId>
    <version>4.2.9</version>
</dependency>
<!-- SpringBoot / Grails 的项目直接使用以下依赖，更为方便（只添加这一个依赖即可） -->
<dependency>
    <groupId>cn.zhxu</groupId>
    <artifactId>bean-searcher-boot-starter</artifactId>
    <version>4.2.9</version>
</dependency>
<!-- Solon 项目直接使用以下依赖（只添加这一个依赖即可，功能同 bean-searcher-boot-starter） -->
<dependency>
    <groupId>cn.zhxu</groupId>
    <artifactId>bean-searcher-solon-plugin</artifactId>
    <version>4.2.9</version>
</dependency>
```

### Gradle

```groovy
// Bean Searcher 核心依赖，任何框架都可使用该依赖
implementation 'cn.zhxu:bean-searcher:4.2.9'
// SpringBoot / Grails 项目直接使用以下依赖，更为方便（只添加这一个依赖即可）
implementation 'cn.zhxu:bean-searcher-boot-starter:4.2.9'
// Solon 项目直接使用以下依赖（只添加这一个依赖即可，功能同 bean-searcher-boot-starter）
implementation 'cn.zhxu:bean-searcher-solon-plugin:4.2.9'
```

::: tip 提示
* 依赖 `bean-searcher-boot-starter` 的 `v3.0.0 ~ v3.0.4` 与 `v3.1.0 ~ v3.1.2` 支持 `spring-boot [v2.0, v3.0)`。其它 `v4.0` 之前的版本支持 `spring-boot [v1.4+, v3.0)`，v4.0 之后的版本支持 `spring-boot v1.4+（包括 spring-boot v3.x）`（兼容范围更广）。
* 依赖 `bean-searcher-solon-plugin` 支持 `solon v2.2.1+` 
:::

::: warning 注意
Grails 项目若使用 `bean-searcher-boot-starter` 依赖，必须使用 `v3.1.4+`、`v3.2.3+` 与 `v3.3.1+` 的版本（即版本在 `v3.1.3-` ∪ `v3.2.0 ~ v3.2.2` ∪ `v3.3.0` 范围内的 `bean-searcher-boot-starter` 都不支持 Grails 项目）。
:::

## 集成

集成 v3.x 的 Bean Searcher 比 v2.x 更加简单（不再需要配置 SearchBean 所在包名路径）。

通常情况下，我们都是在一个后端的 Java Web 项目中使用 Bean Searcher，它可以在任意的 Web 框架中使用，以下介绍在常见的几种 Web 框架的集成方法：

### Spring Boot / Grails

只需添加 `bean-searcher-boot-starter` 依赖，就已集成完毕！

::: tip 提示
Grails 项目使用 `bean-searcher-boot-starter` 依赖时必须使用大于等于 `v3.1.4`、`v3.2.3` 或 `v3.3.1` 的较新版本。
:::

另外，在 Grails 框架下，如果你想 Bean Searcher 复用它的 domain（域类），则需要在 `application.yml` 中添加以下配置（这是因为 Grails 会在运行时为 domain 添加一个非 DB 映射属性，我们需要将它忽略）：

```yml
bean-searcher:
    sql:
        default-mapping:
            ignore-fields: org_grails_datastore_gorm_GormValidateable__errors
```

* [SpringBoot 集成案例](https://gitee.com/troyzhxu/bean-searcher/tree/dev/bean-searcher-demos/bs-demo-springboot)
* [Grails 集成案例](https://gitee.com/troyzhxu/bean-searcher/tree/dev/bean-searcher-demos/bs-demo-grails)

### 非 Boot 的 Spring 项目

在传统的 Spring MVC 项目中需要添加 `bean-searcher` 核心依赖，然后在项目的 xml 文件内配置如下：

```xml
<bean id="sqlExecutor" 
        class="cn.zhxu.bs.implement.DefaultSqlExecutor" 
        p:dataSource-ref="dataSource" />
<!-- 声明 BeanSearcher 检索器，它查询的结果是 SearchBean 泛型对象 -->
<bean id="beanSearcher" 
        class="cn.zhxu.bs.implement.DefaultBeanSearcher"
        p:sqlExecutor-ref="sqlExecutor" />
<!-- 声明 MapSearcher 检索器，它查询的结果是 Map 对象 -->
<bean id="mapSearcher" 
        class="cn.zhxu.bs.implement.DefaultMapSearcher"
        p:sqlExecutor-ref="sqlExecutor" />
```

### Grails (只使用 bean-searcher 依赖)

在 Grails 项目中集成 Bean Searcher，只需要在 `grails-app/conf/spring/resources.groovy` 文件内配置三个 Bean 即可：

```groovy
import cn.zhxu.bs.implement.DefaultSqlExecutor
import cn.zhxu.bs.implement.DefaultBeanSearcher
import cn.zhxu.bs.implement.DefaultMapSearcher

sqlExecutor(DefaultSqlExecutor) {
    dataSource = ref('dataSource')
}
// 声明 BeanSearcher 检索器，它查询的结果是 SearchBean 泛型对象
beanSearcher(DefaultBeanSearcher) {
    sqlExecutor = ref('sqlExecutor')
}
// 声明 MapSearcher 检索器，它查询的结果是 Map 对象
mapSearcher(DefaultMapSearcher) {
    sqlExecutor = ref('sqlExecutor')
}
```

### Solon 项目

只需添加 `bean-searcher-solon-plugin` 依赖，就已集成完毕！支持 `solon` 的 `v2.2.1` 及以上版本。

::: tip 提示
`bean-searcher-solon-plugin` 也提供了与 `bean-searcher-boot-starter` 一样的配置项。
:::

* [Solon 集成案例](https://gitee.com/troyzhxu/bean-searcher/tree/dev/bean-searcher-demos/bs-demo-solon)

> Solon 文档地址：https://solon.noear.org/

### Others

在其它任意的 Java 项目中，都可以在项目启动时，使用 `SearcherBuilder ` 快速构建一个 `MapSearcher` 和 `BeanSearcher` 检索器: 

```java
// 使用默认数据源
DefaultSqlExecutor sqlExecutor = new DefaultSqlExecutor(getDefaultDataSource());
// sqlExecutor.addDataSource("slave1", getSlave1DataSource());  // 添加具名数据源 slave1
// sqlExecutor.addDataSource("slave2", getSlave2DataSource());  // 添加具名数据源 slave2

// 构建 Map 检索器
MapSearcher mapSearcher = SearcherBuilder.mapSearcher()
        .sqlExecutor(sqlExecutor)
        .build();
// 构建 Bean 检索器
BeanSearcher beanSearcher = SearcherBuilder.beanSearcher()
        .sqlExecutor(sqlExecutor)
        .build();
```

## 使用

如果您还不了解  Bean Searcher 适合在在哪些场景使用的话，请先阅读 [介绍 > Bean Searcher](/guide/latest/introduction.html#bean-searcher) 章节。

### 检索器

当在项目中成功集成后，接下来便可以在我们的业务代码（Controller 或 Service）中拿到检索器实例了。

Spring 或 Grails 项目都可以直接注入（Grails 项目中不需要使用 `@Autowired` 注解）：

```java
/**
 * 注入 Map 检索器，它检索出来的数据以 Map 对象呈现
 */
@Autowired
private MapSearcher mapSearcher;
/**
 * 注入 Bean 检索器，它检索出来的数据以 泛型 对象呈现
 */
@Autowired
private BeanSearcher beanSearcher;
```

其它项目，可以把在项目启动时构建出来的检索器直接传进来，或使用自己的注入方式进行注入。

::: warning 注意
如果你的 Spring 容器中同时有 `MapSearcher` 与 `BeanSearcher` 两个实例（使用 `bean-searcher-boot-starter` 依赖时默认向 Spring 容器注入添加两个检索器实例），则不能使用如下方式注入：
```java
@Autowired
private Searcher Searcher;
```
因为有 `MapSearcher` 与 `BeanSearcher` 都是 `Searcher` 的实例，Spring 容器分不清你想要的到底是哪一个。

当使用 `bean-searcher-boot-starter` 的版本是 `v3.0.5` 或 `v3.1.3+` 时，则不存在此问题，它会默认注入 `MapSearcher` 实例。
:::

拿到检索器后，接着我们看一下 `MapSearcher` 与 `BeanSearcher` 检索器都提供了哪些方法：

#### 共同拥有的方法

* `searchCount(Class<T> beanClass, Map<String, Object> params): Number` 查询指定条件下的数据 **总条数**
* `searchSum(Class<T> beanClass, Map<String, Object> params, String field): Number` 查询指定条件下的 **某字段** 的 **统计值**
* `searchSum(Class<T> beanClass, Map<String, Object> params, String[] fields): Number[]` 查询指定条件下的 **多字段** 的 **统计值**

> 检索参数 `params` 是一个条件集合，包含字段过滤、分页、排序 等参数

#### 只在 MapSearcher 内的方法

* `search(Class<T> beanClass, Map<String, Object> params): SearchResult<Map<String, Object>>` **分页** 查询指定条件下数据 **列表** 与 **总条数**
* `search(Class<T> beanClass, Map<String, Object> params, String[] summaryFields): SearchResult<Map<String, Object>>` **同上** + 多字段 **统计**
* `searchFirst(Class<T> beanClass, Map<String, Object> params): Map<String, Object>` 查询指定条件下的 **第一条** 数据 
* `searchList(Class<T> beanClass, Map<String, Object> params): List<Map<String, Object>>` **分页** 查询指定条件下数据 **列表** 
* `searchAll(Class<T> beanClass, Map<String, Object> params): List<Map<String, Object>>` 查询指定条件下 **所有** 数据 **列表**

> 以上方法的查询出的单条数据都以 `Map` 对象呈现

#### 只在 BeanSearcher 内的方法

* `search(Class<T> beanClass, Map<String, Object> params): SearchResult<T>` **分页** 查询指定条件下数据 **列表** 与 **总条数**
* `search(Class<T> beanClass, Map<String, Object> params, String[] summaryFields): SearchResult<T>` **同上** + 多字段 **统计**
* `searchFirst(Class<T> beanClass, Map<String, Object> params): T` 查询指定条件下的 **第一条** 数据
* `searchList(Class<T> beanClass, Map<String, Object> params): List<T>` **分页** 查询指定条件下数据 **列表** 
* `searchAll(Class<T> beanClass, Map<String, Object> params): List<T>` 查询指定条件下 **所有** 数据 **列表**

> 以上方法的查询出的单条数据都以泛型 `T` 对象呈现

完整的接口定义，可查阅：[Searcher](https://gitee.com/troyzhxu/bean-searcher/blob/master/bean-searcher/src/main/java/cn/zhxu/bs/Searcher.java)、[MapSearcher](https://gitee.com/troyzhxu/bean-searcher/blob/master/bean-searcher/src/main/java/cn/zhxu/bs/MapSearcher.java) 与 、[BeanSearcher](https://gitee.com/troyzhxu/bean-searcher/blob/master/bean-searcher/src/main/java/cn/zhxu/bs/BeanSearcher.java) 。

### 实体类

在 Bean Searcher 的世界里，与数据库有映射关系的实体类成为 SearchBean（一个实体类可以映射一张表，也可以映射多张表），例如，您的项目中可能已经存在这样的一个实体类了：

```java
public class User {             // 默认映射到 user 表

    private Long id;            // 默认映射到 id 字段
    private String name;        // 默认映射到 name 字段
    private int age;            // 默认映射到 age 字段

    // Getter and Setter ...
}
```

相比 v2.x, Bean Searcher v3.x 的实体类可以省略注解，也可以自定义识别其它框架的注解。

在注解缺省的情况下，Bean Searcher 认为它是一个单表实体类（即只映射数据库中的一张表，联表实体类 的例子 请参考 [实体类 > 多表关联](/guide/latest/bean.html#多表关联) 章节。

### 开始检索

有了实体类后，接下来我们便用 `MapSearcher` 的 `search(Class<T> beanClass, Map<String, Object> params): SearchResult<Map<String, Object>>` 方法来体验一下如何 **只用一行代码** 实现一个检索接口，代码如下：

```java
@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private MapSearcher mapSearcher;              // 注入 BeanSearcher 的检索器

    @GetMapping("/index")
    public SearchResult<Map<String, Object>> index(HttpServletRequest request) {
        // 一行代码，实现一个用户检索接口（MapUtils.flat 只是收集前端的请求参数）
        return mapSearcher.search(User.class, MapUtils.flat(request.getParameterMap()));
    }

}
```

::: tip 代码解析
上面的 `MapUtils` 是 Bean Searcher 提供的一个工具类，`MapUtils.flat(request.getParameterMap())` 只是为了把前端传来的请求参数统一收集起来，然后剩下的，就全部交给 `MapSearcher` 检索器了。<br>
当然不直接从 `request` 里取参数也是可以的，只是代码这么写看起来比较简洁。
:::

上面的代码，实现了一个 `/user/index` 接口，它的方法体里真的只有一行代码，但这个接口能支持哪些请求参数呢？不同的请求参数又能输出怎样的结果呢，接下来让我们来简单列举一下：

#### （1）无参请求

* GET /user/index
* 返回结果：

```json
{
    "dataList": [           // 用户列表，默认返回第 1 页，默认分页大小为 15 （可配置）
        { "id": 1, "name": "Jack", "age": 25 },,,
    ],
    "totalCount": 100       // 用户总数
}
```

#### （2）分页请求（page | size）

* GET /user/index? page=2 & size=10 
* 返回结果：结构同 **（1）**（只是每页 10 条，返回第 2 页）

::: tip
参数名 `size` 和 `page` 可自定义， `page` 默认从 `0` 开始，同样可自定义，并且可与其它参数组合使用
:::

#### （3）数据排序（sort | order）

* GET /user/index? sort=age & order=desc 
* 返回结果：结构同 **（1）**（只是 dataList 数据列表以 age 字段降序输出）

::: tip
参数名 `sort` 和 `order` 可自定义，可和其它参数组合使用
:::

#### （4）指定（排除）字段（onlySelect | selectExclude）

* GET /user/index? onlySelect=id,name
* GET /user/index? selectExclude=age
* 返回结果：（ dataList 数据列表只含 id 与 name 字段）

```json
{
    "dataList": [           // 用户列表，默认返回第 1 页（只包含 id 和 name 字段）
        { "id": 1, "name": "Jack" },,,
    ],
    "totalCount": 100       // 用户总数
}
```

::: tip
参数名 `onlySelect` 和 `selectExclude` 可自定义，可和其它参数组合使用
:::

#### （5）字段过滤（ [field]-op=eq ）

* GET /user/index? age=20
* GET /user/index? age=20 & age-op=eq
* 返回结果：结构同 **（1）**（但只返回 age=20 的数据）

::: tip
参数 `age-op=eq` 表示 `age` 的 **字段运算符** 是 `eq`（`Equal` 的缩写），表示参数 `age` 与参数值 `20` 之间的关系是 `Equal`，由于 `Equal` 是一个默认的关系，所以 `age-op=eq` 也可以省略

参数名 `age-op` 的后缀 `-op` 可自定义，且可与其它字段参数 和 上文所列的参数（分页、排序、指定字段）组合使用，下文所列的字段参数也是一样，不再复述。
:::

#### （6）字段过滤（ [field]-op=ne ）

* GET /user/index? age=20 & age-op=ne
* 返回结果：结构同 **（1）**（但只返回 age != 20 的数据，`ne` 是 `NotEqual` 的缩写）

#### （7）字段过滤（ [field]-op=ge ）

* GET /user/index? age=20 & age-op=ge
* 返回结果：结构同 **（1）**（但只返回 age >= 20 的数据，`ge` 是 `GreateEqual` 的缩写）

#### （8）字段过滤（ [field]-op=le ）

* GET /user/index? age=20 & age-op=le
* 返回结果：结构同 **（1）**（但只返回 age <= 20 的数据，`le` 是 `LessEqual` 的缩写）

#### （9）字段过滤（ [field]-op=gt ）

* GET /user/index? age=20 & age-op=gt
* 返回结果：结构同 **（1）**（但只返回 age > 20 的数据，`gt` 是 `GreateThan` 的缩写）

#### （10）字段过滤（ [field]-op=lt ）

* GET /user/index? age=20 & age-op=lt
* 返回结果：结构同 **（1）**（但只返回 age < 20 的数据，`lt` 是 `LessThan` 的缩写）

#### （11）字段过滤（ [field]-op=bt ）

* GET /user/index? age-0=20 & age-1=30 & age-op=bt
* 返回结果：结构同 **（1）**（但只返回 20 <= age <= 30 的数据，`bt` 是 `Between` 的缩写）

::: tip 提示
参数 `age-0=20` 表示 `age` 的第 0 个参数值是 `20`。上文中提到的 `age=20` 实际上是 `age-0=20` 的简写形式。
参数名 `age-0` 与 ` age-1` 中的连字符 `-` 可自定义。

**优化**：觉得 age-0=20 & age-1=30 有点复杂，想用 **age=[20,30]** 替代？可以的！请参考 [参数过滤器](/guide/latest/advance.html#参数过滤器) 章节。
:::

#### （12）字段过滤（ [field]-op=il ）

* GET /user/index? age-0=20 & age-1=30 & age-2=40 & age-op=il
* 返回结果：结构同 **（1）**（但只返回 age in (20, 30, 40) 的数据，`il` 是 `InList` 的缩写）

::: tip 优化
同理 age-0=20 & age-1=30 & age-2=40 可优化为 **age=[20,30,40]**，参考 [参数过滤器](/guide/latest/advance.html#参数过滤器) 章节。
:::

#### （13）字段过滤（ [field]-op=ct ）

* GET /user/index? name=Jack & name-op=ct
* 返回结果：结构同 **（1）**（但只返回 name 包含 Jack 的数据，`ct` 是 `Contain` 的缩写）

#### （14）字段过滤（ [field]-op=sw ）

* GET /user/index? name=Jack & name-op=sw
* 返回结果：结构同 **（1）**（但只返回 name 以 Jack 开头的数据，`sw` 是 `StartWith` 的缩写）

#### （15）字段过滤（ [field]-op=ew ）

* GET /user/index? name=Jack & name-op=ew
* 返回结果：结构同 **（1）**（但只返回 name 以 Jack 结尾的数据，`sw` 是 `EndWith` 的缩写）

#### （16）字段过滤（ [field]-op=ey ）

* GET /user/index? name-op=ey
* 返回结果：结构同 **（1）**（但只返回 name 为空 或为 null 的数据，`ey` 是 `Empty` 的缩写）

#### （17）字段过滤（ [field]-op=ny ）

* GET /user/index? name-op=ny
* 返回结果：结构同 **（1）**（但只返回 name 非空 的数据，`ny` 是 `NotEmpty` 的缩写）

#### （18）忽略大小写（ [field]-ic=true ）

* GET /user/index? name=Jack & name-ic=true
* 返回结果：结构同 **（1）**（但只返回 name 等于 Jack (忽略大小写) 的数据，`ic` 是 `IgnoreCase` 的缩写）

::: tip
参数名 `name-ic` 中的后缀 `-ic` 可自定义，该参数可与其它的参数组合使用，比如这里检索的是 name 等于 Jack 时忽略大小写，但同样适用于检索 name 已 Jack 开头或结尾时忽略大小写。
:::

Bean Searcher 还支持 **更多** 的检索方式（甚至可以自定义，参考： [参数 > 字段参数 > 字段运算符](/guide/latest/params.html#字段运算符) 章节），这里就不再列举了。

本例的 `/user/index` 接口里我们只写了一行代码，它便可以支持这么多种的检索方式，你现在体会到了 **一行代码便可实现复杂列表检索** 的含义了吗？有没有觉得你现在写的一行代码可以干过别人的一百行呢？

::: tip
本例所举的是一个简单的单表查询，实际上，无论是单表还是多表，只要在映射在同一个实体类里，就可以支持上文所列的所有检索方式。

至于如何让多张数据库表映射到同一个实体类，请看下一章节：[实体类](/guide/latest/bean.html)。
:::

### SQL 日志

如果需要查看 Bean Searcher 的 SQL 执行日志，只需在您的日志配置文件中将 `cn.zhxu.bs.implement.DefaultSqlExecutor` 的日志级别调整为 `DEBUG` 即可。

> 若日志级别配置为 `INFO` 或 `WARN`，则只打印 慢 SQL 日志，配置为 `DEBUG` 则 慢 SQL 与 普通 SQL 都打印。

* 示例1：SpringBoot 项目 `application.yml`

```yml
logging:
  level:
    cn.zhxu.bs: DEBUG
```

* 示例2：SpringBoot 项目 `application.properties`

```yml
logging.level.cn.zhxu.bs: DEBUG
```

* 示例3：SpringBoot 项目的日志配置，可参考 [logback-spring.xml](https://gitee.com/troyzhxu/bean-searcher/blob/master/bean-searcher-demos/bs-demo-springboot/src/main/resources/logback-spring.xml)

* 示例4：Grails 项目的日志配置，可参考 [logback.groovy](https://gitee.com/troyzhxu/bean-searcher/blob/master/bean-searcher-demos/grails-demo/grails-app/conf/logback.groovy)

输出级别配置好后，SQL 日志的效果如下：

![](/sql_log.png)

> Bean Searcher 使用日志门面 `slf4j-api` 打印日志（这也是 Bean Searcher 的唯一依赖），它并不依赖 `logback`，所以 `log4j` 等其它日志框架也是支持的哦。

慢 SQL 相关配置，可参考：[高级 > 慢 SQL 日志与监听](/guide/latest/advance.html#慢-sql-日志与监听（since-v3-7-0）) 章节。