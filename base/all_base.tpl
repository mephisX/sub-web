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
Request: local (us, none)
#}
{% if request.target == "quanx" %}
[general]
network_check_url=http://www.baidu.com/
server_check_url=http://bing.com/
excluded_routes=192.168.0.0/16, 193.168.0.0/24, 10.0.0.0/8, 172.16.0.0/12, 100.64.0.0/10, 17.0.0.0/8
dns_exclusion_list = *.cmpassport.com,  *.jegotrip.com.cn, *.icitymobile.mobi, *.pingan.com.cn, *.cmbchina.com
geo_location_checker=http://ip-api.com/json/?lang = zh-CN, https://gist.githubusercontent.com/xxxxxx/xxxxxxxxxxxx/raw/ipapi.js
# 指定在某个 Wi-Fi 下暂停 Quantumult X
;ssid_suspended_list = LINK_22E174, LINK_22E175

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

[policy]
static=🇭🇰 IPLC 香港, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Hong_Kong.png
static=🇭🇰 BGP 香港, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Hong_Kong.png
static=🇸🇬 IPLC 新加坡, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Singapore.png
static=🇸🇬 BGP 新加坡, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Singapore.png
static=🇺🇸 IPLC 美国, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/United_States.png
static=🇺🇸 BGP 美国, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/United_States.png
static=Final, proxy, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Final.png
static=Telegram, proxy, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Telegram.png
static=GlobalMedia, proxy, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/GlobalMedia.png

[server_remote]

[filter_remote]
https://raw.githubusercontent.com/ConnersHua/Profiles/master/Quantumult/X/Filter/Unbreak.list, tag=后续规则修正, force-policy=direct, enabled=true
https://raw.githubusercontent.com/NobyDa/Script/master/QuantumultX/AdRule.list, tag=广告, force-policy=reject, enabled=true
https://raw.githubusercontent.com/ConnersHua/Profiles/master/Quantumult/X/Filter/Advertising.list, tag=广告, force-policy=reject, enabled=true
https://raw.githubusercontent.com/ConnersHua/Profiles/master/Quantumult/X/Filter/Hijacking.list, tag=运营商劫持及恶意网站, force-policy=reject, enabled=true
https://raw.githubusercontent.com/ConnersHua/Profiles/master/Quantumult/X/Filter/Telegram.list, tag=Telegram, enabled=true
https://raw.githubusercontent.com/ConnersHua/Profiles/master/Quantumult/X/Filter/GlobalMedia.list, tag=国际流媒体服务, enabled=true
https://raw.githubusercontent.com/ConnersHua/Profiles/master/Quantumult/X/Filter/Global.list, tag=全球加速, force-policy=proxy, enabled=true
https://raw.githubusercontent.com/ConnersHua/Profiles/master/Quantumult/X/Filter/Apple.list, tag=Apple服务, force-policy=direct, enabled=true
https://raw.githubusercontent.com/ConnersHua/Profiles/master/Quantumult/X/Filter/China.list, tag=中国直连, force-policy=direct, enabled=true
;https://raw.githubusercontent.com/crossutility/Quantumult-X/master/filter.txt, tag=Sample, force-policy=your-policy-name, enabled=true

[rewrite_remote]
https://raw.githubusercontent.com/NobyDa/Script/master/QuantumultX/Rewrite_lhie1.conf, tag = Rewrite_lhie1, enabled = true
https://raw.githubusercontent.com/ConnersHua/Profiles/master/Quantumult/X/Rewrite.conf, tag = ConnersHua, enabled = true

[server_local]

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
passphrase = {{ passphrase }}
p12 = {{ p12 }}
hostname = 
{% endif %}


{% if request.target == "mellow" %}
{% endif %}


{% if request.target == "surfboard" %}
{% endif %}


{% if request.target == "surge" %}
{% endif %}


{% if request.target == "loon" %}
{% endif %}
