# api-list

#### 列表

```
GET /api-list/index
```

参数

```
无
```

返回

```
视图 index.ftl
模型数据格式：
{
  "code": 1
  "status": "success"
  "data": [
    {
      "id": 10000,
      "url": "https://api.asilu.com/today",
      "paramsStr": null,
      "name": "历史上的今天",
      "image": "/api-list/images/10000.webp",
      "comment": "历史上的今天"
    },
    {
      "id": 10001,
      "url": "https://v1.alapi.cn/api/lajifenlei",
      "paramsStr": "name",
      "name": "垃圾分类查询",
      "image": "/api-list/images/10001.webp",
      "comment": "识别垃圾种类"
    },
    {},
  ]
}
```


#### 查看详情

```
GET /api-list/details/{id}
```

参数

```
/{id} // 即API的id值
```

无参API返回

```
视图 {id}.ftl
模型数据格式：
{
  "code": 1
  "status": "success"
  "data": {
    "apiInfo": {
      "id": 10000,
      "url": "https://api.asilu.com/today",
      "paramsStr": null,
      "name": "历史上的今天",
      "image": "/api-list/images/10000.webp",
      "comment": "历史上的今天"
      }
  }
}
```

有参API返回

```
视图 {id}.ftl
模型数据格式：
{
  "code": 1
  "status": "success"
  "data": {
    "apiInfo": {
      "id": 10001,
      "url": "https://v1.alapi.cn/api/lajifenlei",
      "paramsStr": "name",
      "name": "垃圾分类查询",
      "image": "/api-list/images/10001.webp",
      "comment": "识别垃圾种类"
      },
    "params": ["name"]
  }
}
```

#### 详情操作-API访问方式（url?a=1&b=2）

```
GET /api-list/api/interview/{id}
```

参数

```
/{id} // 即API的id值
param1: value1 // param取决于当前API是否需要参数
```

返回-取决于访问的API

```
// API-IP查询
{
  "ip":"39.190.139.17",
  "pro":"浙江省",
  "proCode":"330000",
  "city":"嘉兴市",
  "cityCode":"330400",
  "region":"",
  "regionCode":"0",
  "addr":"浙江省嘉兴市 移通",
  "regionNames":"",
  "err":""
}
// API-一言
{
  "code": 200,
  "msg": "success",
  "data": {
    "id": 1088,
    "hitokoto": "为自己当初的誓言而努力！",
    "type": "e",
    "from": "疯人",
    "creator": "一人"
  },
  "author": {
    "name": "Alone88",
    "desc": "由Alone88提供的免费API 服务，官方文档：www.alapi.cn"
  }
}
```

#### 详情操作-API访问方式（url/key/value）

```
GET /api-list/api/interview_path/{id}
```

参数

```
/{id} //即API的id值
param1: value1 //param取决于当前API是否需要参数
```

返回-取决于访问的API

```
// API-十五天天气
{
  "message":"success感谢又拍云(upyun.com)提供CDN赞助",
  "status":200,
  "date":"20200530",
  "time":"2020-05-30 19:42:56",
  "cityInfo":{"city":"成都市","citykey":"101270101","parent":"四川","updateTime":"18:46"},
  "data":{
    "shidu":"41%",
    "pm25":28.0,
    "pm10":49.0,
    "quality":"轻度",
    "wendu":"31",
    "ganmao":"儿童、老年人及心脏、呼吸系统疾病患者人群应减少长时间或高强度户外锻炼",
    "forecast":[{
      "date":"30",
      "high":"高温 34℃",
      "low":"低温 21℃",
      "ymd":"2020-05-30",
      "week":"星期六",
      "sunrise":"06:03",
      "sunset":"20:00",
      "aqi":47,
      "fx":"南风",
      "fl":"<3级",
      "type":"多云",
      "notice":"阴晴之间，谨防紫外线侵扰"
    },
    {},
    {},
    {},
  }
}
```

#### 详情操作-API访问方式（无参）

```
GET /api-list/api/interview_no_params/{id}
```

参数

```
/{id} //即API的id值
```

返回-取决于访问的API

```
// API-土味情话
{
    "code": 200,
    "msg": "success",
    "data": {
        "content": "你知道相得益彰吗？就像你的美貌、气质和性格。"
    },
    "author": {
        "name": "Alone88",
        "desc": "由Alone88提供的免费API 服务，官方文档：www.alapi.cn"
    }
}
```

