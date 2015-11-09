## 图片服务器需求及解决方案

### 需求

- 图片管理：上传，修改，删除，查看 
- 图片预览：友好的界面
- 图片存储：图片以 1T 为目标
- 图片批量上传
- 为各个站点提供图片访问
- 图片处理：大小，裁切，质量，水印
- 访问权限：限制访问ip
- url唯一性：每个图片有一个唯一的url，比如一个32位长度的字符串

### 流程

- A站页面根据产品规则，生成html页面，页面中有许多image url,如 http://img.xxx.com/images/cache/330x528_water_mark/adoringdress.com/product/201511/qC4RD096i9OazIv0DMi0ZUVNXEboiHUH.jpg
- 用户访问该页面，向该域名请求该图片。
- A站前端架设静态缓存服务器Squid，varnish，CDN？ 如果有，命中，返回，如果没有，访问后端服务器，获取该图片，并存储。
- 后端http 服务器 nginx，apache，收到请求，转发给 php image client 处理该请求（这里原本是可以直接去image server 请求的，不过为了对外隐蔽 ip指向，需要做一层封装），并返回该图片。
- php image client 收到请求，curl 访问 thumbor 服务器，请求图片，并返回，其中携带着的链接，为真实 image 存储服务器的 url 例如: http://thumbor.com:8888/auth/http://imageserver.com/qC4RD096i9OazIv0DMi0ZUVNXEboiHUH.jpg
- 真实的图片服务器，即为一个图片站，主要提供图片存储，管理服务。

### API

#### 常规api
- 根据sn，返回图片name，order，url
- 根据url，返回图片

#### 管理api

- 增加图片
- 修改图片
- 删除图片
- 查看图片

### 问题

- 图片是怎么关联的？
	
	作为商品，只有 sn，后台需要有获取图片的功能，根据sn获取图片的name (md5串)

- 图片需要存储哪些信息？
	- id          //主键，自增，唯一
	- name        //生成的name 重要，索引，唯一
	- origin_name //原始名称 重要，索引，唯一
	- sn          //产品编号 重要，索引
	- order       //排序     常规
	- path        //存储路径 必填  
	- size        //大小     常规 
	- site        //站点     可选
	- server      //服务器   必填
	- ip          //ip      常规
	- created_at  //存储时间 常规
	- updated_at  //更新时间 常规

### 涉及到的工作
#### image server
- 不考虑分布式
- 图片上传：前端 + 后端

http://www.plupload.com/examples/queue


- 图片管理：前端 + 后端
- 测试

#### thumbor server
- thumbor：假设 + 配置
	nginx + supervisor + thumbor

- 清晰度 + 大小 + 水印 + 剪裁（靠后）+ 人脸识别（靠后）
- 测试
 
#### thumbor client
- thumbor client： client + 集成
- 测试 
