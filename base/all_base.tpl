{# 
Target : Value Set
Request: local (Quantumult / Quantumult X)
Baseset: passphrase (Quantumult / Quantumult X)
         p12 (Quantumult / Quantumult X)
         iconurl (Quantumult X)
#}
{% if request.target == "quan" or request.target == "quanx" %}
{% if request.local == "us" %}
  {{ set("appleDefault","DIRECT") }}
  {{ set("appleApi","🇺🇸 美区偏好") }}
  {{ set("appleCDN","DIRECT") }}
  {{ set("appleLocal","📡 定位偏好") }}
  {{ set("appleNews","🇺🇸 美区偏好") }}
{% else %}
  {{ set("appleDefault","DIRECT") }}
  {{ set("appleApi","DIRECT") }}
  {{ set("appleCDN","DIRECT") }}
  {{ set("appleLocal","DIRECT") }}
  {{ set("appleNews","DIRECT") }}
{% endif %}
  {{ set("passphrase","XXXXXXXX") }}
  {{ set("p12","XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX") }}
  {{ set("iconUrl","https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/") }}
{% endif %}


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
Target : Quantumult
Request: local (us, none)
#}
{% if request.target == "quan" %}
[SERVER]

[SOURCE]

[BACKUP-SERVER]

[SUSPEND-SSID]

[POLICY]

[DNS]
119.29.29.29,223.5.5.5,1.0.0.1,8.8.8.8

[REWRITE]
^https?:\/\/(www.)?(g|google)\.cn url 302 https://www.google.com
^https?:\/\/(www.)?taobao\.com\/ url 302 https://taobao.com/
^https?:\/\/(www.)?jd\.com\/ url 302 https://www.jd.com/

[URL-REJECTION]

[TCP]


[GLOBAL]

[HOST]

[STATE]
STATE,AUTO

[MITM]
passphrase = {{ passphrase }}
p12 = {{ p12 }}
{% endif %}


{# 
Target : Quantumult X
Request: local (us, none)
#}
{% if request.target == "quanx" %}
[general]
excluded_routes = 192.168.0.0/16, 172.16.0.0/12, 100.64.0.0/10, 10.0.0.0/8
geo_location_checker = http://ip-api.com/json/?lang = zh-CN, https://gist.githubusercontent.com/xxxxxx/xxxxxxxxxxxx/raw/ipapi.js
network_check_url = http://www.baidu.com/
server_check_url = http://www.gstatic.com/generate_204

[dns]
server = 223.5.5.5
server = 119.29.29.29
server = 1.0.0.1
server = 8.8.8.8

[policy]
static = 🎯 总体偏好, direct, img-url = {{ iconUrl }}Star.png
static = 📺 影视偏好, direct, img-url = {{ iconUrl }}Streaming.png
static = 🇭🇰 港区偏好, direct, img-url = {{ iconUrl }}Hong_Kong.png
static = 🇨🇳 台区偏好, direct, img-url = {{ iconUrl }}Taiwan.png
static = 🇯🇵 日区偏好, direct, img-url = {{ iconUrl }}Japan.png
static = 🇷🇺 俄区偏好, direct, img-url = {{ iconUrl }}Russia.png
static = 🇺🇸 美区偏好, direct, img-url = {{ iconUrl }}United_States.png
static = 📡 定位偏好, direct, img-url = {{ iconUrl }}Domestic.png
static = 🇺🇳 优选切换, direct, img-url = {{ iconUrl }}Proxy.png
static = 🇺🇳 剩余切换, direct, img-url = {{ iconUrl }}Proxy.png
static = 🇨🇳 直连选择, direct, img-url = {{ iconUrl }}Direct.png
available = 🇸🇲 专线容错, direct, img-url = {{ iconUrl }}IPLC.png
available = 🇭🇰 香港容错, direct, img-url = {{ iconUrl }}HK.png
available = 🇨🇳 台湾容错, direct, img-url = {{ iconUrl }}TW.png
available = 🇯🇵 日本容错, direct, img-url = {{ iconUrl }}JP.png
available = 🇷🇺 俄国容错, direct, img-url = {{ iconUrl }}RU.png
available = 🇺🇸 美国容错, direct, img-url = {{ iconUrl }}US.png
available = 🇫🇲 备用容错, direct, img-url = {{ iconUrl }}UN.png

[server_remote]

[filter_remote]

[rewrite_remote]
{% if request.local == "us" %}
https://raw.githubusercontent.com/NobyDa/Script/master/QuantumultX/Js_local_WorkingCopy.conf, tag = NobyDa, enabled = true
{% endif %}
https://raw.githubusercontent.com/ConnersHua/Profiles/master/Quantumult/X/Rewrite.conf, tag = ConnersHua, enabled = true

[server_local]

[filter_local]


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
