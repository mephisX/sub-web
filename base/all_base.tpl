{# 
Target : Clash, ClashR
Request: dns (fake, tun, none)
         new_name (true, false)
         wifi (true, false)
#}
{% if request.target == "clash" or request.target == "clashr" %}
port: 7890
socks-port: 7891
redir-port: 7892
allow-lan: true
mode: Rule
log-level: info
external-controller: 0.0.0.0:9090
dns:
  enable: true
  ipv6: false
{% if exists("request.dns") %}
{% if request.dns == "fake" %}
  listen: 0.0.0.0:53
  enhanced-mode: fake-ip
  fake-ip-range: 198.18.0.1/16
  fake-ip-filter:
    - "*.lan"
    - "localhost.ptlogin2.qq.com"
    - "dns.msftncsi.com"
    - "www.msftncsi.com"
    - "www.msftconnecttest.com"
{% endif %}
{% if request.dns == "tun" %}
  listen: 0.0.0.0:53
  enhanced-mode: redir-host
{% endif %}
{% else %}
  listen: 0.0.0.0:53
  enhanced-mode: redir-host
{% endif %}
  nameserver:
    - 1.2.4.8
    - 119.29.29.29
    - https://dns.alidns.com/dns-query
  fallback:
    - https://dns.google/dns-query
    - tls://1.1.1.1:853
    - https://1.1.1.1/dns-query
    - tls://8.8.8.8:853
  fallback-filter:
    geoip: true
    ipcidr:
      - 240.0.0.0/4
{% if request.wifi == "true" %}
experimental:
  interface-name: WLAN
{% else %}
experimental:
  interface-name: 以太网
{% endif %}
{% if request.new_name == "true" %}
proxies: ~
proxy-groups: ~
rules: ~
{% else %}
Proxy: ~
Proxy Group: ~
Rule: ~
{% endif %}
{% endif %}

{# 
Target : Quantumult X
Request: self (true, false)
         tf (true, false)
#}
{% if request.target == "quanx" %}
[general]
network_check_url=http://www.baidu.com/
server_check_url=http://bing.com/
excluded_routes=192.168.0.0/16, 193.168.0.0/24, 10.0.0.0/8, 172.16.0.0/12, 100.64.0.0/10, 17.0.0.0/8
dns_exclusion_list = *.cmpassport.com,  *.jegotrip.com.cn, *.icitymobile.mobi, *.pingan.com.cn, *.cmbchina.com
geo_location_checker=http://ip-api.com/json/?lang = zh-CN, https://gist.githubusercontent.com/xxxxxx/xxxxxxxxxxxx/raw/ipapi.js
{% if request.self == "true" %}
ssid_suspended_list = Ccccccc
{% else %}
# 指定在某个 Wi-Fi 下暂停 Quantumult X
;ssid_suspended_list = LINK_22E174, LINK_22E175
{% endif %}

[dns]
server=1.2.4.8
server=119.29.29.29
server=223.5.5.5
server=/*.taobao.com/223.5.5.5
server=/*.tmall.com/223.5.5.5
server=/*.alipay.com/223.5.5.5
server=/*.alicdn.com/223.5.5.5
server=/*.aliyun.com/223.5.5.5
server=/*.jd.com/119.28.28.28
server=/*.qq.com/119.28.28.28
server=/*.tencent.com/119.28.28.28
server=/*.weixin.com/119.28.28.28
server=/*.bilibili.com/119.29.29.29
server=/hdslb.com/119.29.29.29
server=/*.163.com/119.29.29.29
server=/*.126.com/119.29.29.29
server=/*.126.net/119.29.29.29
server=/*.127.net/119.29.29.29
server=/*.netease.com/119.29.29.29
server=/*.mi.com/119.29.29.29
server=/*.xiaomi.com/119.29.29.29
server=/*.discordapp.com/8.8.4.4
server=/*.discord.media/8.8.4.4
server=/*.discord.gg/8.8.4.4
server=/*.google.com/8.8.8.8
server=/*.twitter.com/8.8.8.8

[policy]
static=IPLC, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/IPLC.png
static=BGP, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/BGP.png
static=VMESS, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/VMess.png
static=Special, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/NyanCat.png
static=Premium, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/NyanCat.png
static=Game, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Game.png
static=Daily, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Daily.png
static=SelectHK, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Hong_Kong.png
static=SelectTW, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/CN.png
static=SelectKR, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/KR.png
static=SelectJP, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Japan.png
static=SelectSGP, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Singapore.png
static=SelectSEA, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/IPLC.png
static=SelectAU, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/IPLC.png
static=SelectUS, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/United_States.png
static=SelectCA, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Canada.png
static=SelectEU, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/EU.png
static=LowRateHK, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Hong_Kong.png
static=LowRateSGP, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Singapore.png
static=PROXY, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Proxy.png
static=FINAL, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Final.png
static=Apple, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Apple.png
static=Microsoft, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Microsoft.png
static=Telegram, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Telegram.png
static=GlobalMedia, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/GlobalMedia.png
static=GlobalGameDownload, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Download.png
static=Hijacking, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Hijacking.png

[server_remote]

[filter_remote]

[rewrite_remote]
https://raw.githubusercontent.com/NobyDa/Script/master/QuantumultX/Rewrite_lhie1.conf, tag = 去广告1, enabled = true
https://raw.githubusercontent.com/ConnersHua/Profiles/master/Quantumult/X/Rewrite.conf, tag = 去广告2, enabled = true
{% if request.tf == "true" %}
https://raw.githubusercontent.com/NobyDa/Script/master/QuantumultX/Js.conf, tag=NobyDa, enabled=true
{% else %}
https://raw.githubusercontent.com/nzw9314/QuantumultX/master/Js_local_WorkingCopy.conf, tag=nzw9314, enabled=true
https://raw.githubusercontent.com/nzw9314/QuantumultX/master/Get_Cookie_New.conf, tag=获取Cookie, enabled=true
{% endif %}

[server_local]

[task_local]
# 什么值得买
#浏览器访问并登录: https://zhiyou.smzdm.com/user/login
5 0 * * * nzw9314/chavyleung/smzdm/quanx/smzdm.js

# 百度签到
#先登录,浏览器访问一下: https://tieba.baidu.com 或者 https://tieba.baidu.com/index/
5 0 * * * nzw9314/chavyleung/tieba/tieba.js

# 百度贴吧
#打开App,访问下右下角 `我的
1,2,3 0 * * * nzw9314/NobyDa/QuantumultX/TieBa-DailyBonus/TieBa_DailyBonus_QX.js

# 饿了么   (By @syzzzf)
#打开 APP, 访问下`我的`>`签到领红包`(左上角)
3 0 * * * nzw9314/Task/elemSign.js

# 网易云音乐
#浏览器访问并登录: https://music.163.com/m/login
3 0 * * * nzw9314/chavyleung/neteasemusic/quanx/neteasemusic.js

[filter_local]
ip-cidr, 10.0.0.0/8, direct
ip-cidr, 127.0.0.0/8, direct
ip-cidr, 172.16.0.0/12, direct
ip-cidr, 192.168.0.0/16, direct
ip-cidr, 224.0.0.0/24, direct
geoip, cn, direct
final, Final

[rewrite_local]

[mitm]
{% if request.self == "true" %}
passphrase = FA1A9849
p12 = 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
{% else %}
passphrase = 
p12 = 
{% endif %}
{% endif %}


{% if request.target == "mellow" %}
{% endif %}


{% if request.target == "surfboard" %}
{% endif %}


{% if request.target == "surge" %}
{% endif %}


{% if request.target == "loon" %}
{% endif %}
