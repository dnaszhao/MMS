CREATE OR REPLACE PACKAGE "kesplus_platform"."router_common" AUTHID CURRENT_USER AS
	/**
	 * 组装返回结果,用在最后一个aspect的后置逻辑
	 * request		请求信息
	 * response		返回信息
	 */
	PROCEDURE constructResponseBody(request INOUT jsonb, response INOUT jsonb);
	/**
	 * 显示当前操作用户信息
	 * request		请求信息
	 * response		返回信息
	 */
	PROCEDURE showUserInfo(request INOUT jsonb, response INOUT jsonb);
	/**
	 * 校验权限	用在第一个aspect的前置逻辑
	 * request		请求信息
	 * response		返回信息
	 */
	PROCEDURE checkPermission(request INOUT jsonb, response INOUT jsonb);
	PROCEDURE initAppInfo(request INOUT jsonb, response INOUT jsonb);
	/**
	 * 初始化会话属性
	 * request		请求信息
	 * response		返回信息
	 */
	PROCEDURE initContext(request INOUT jsonb, response INOUT jsonb);
	/**
	 * 请求转发,将/auth/login转发到/auth/login2
	 * 为了兼容旧的逻辑,/auth/login为原有逻辑,/auth/login2为新的登录逻辑
	 * request		请求信息
	 * response		返回信息
	 */
	PROCEDURE sendRedirect(request INOUT jsonb, response INOUT jsonb);
	/**
	 * 校验token
	 * request		请求信息
	 * response		返回信息
	 */
	PROCEDURE checkToken(request INOUT jsonb, response INOUT jsonb);
	/**
	 * 校验refreshToke
	 * request		请求信息
	 * response		返回信息
	 */
	PROCEDURE checkRefreshToken(request INOUT jsonb, response INOUT jsonb);
	/**
	 * 校验token的具体逻辑
	 * request		请求信息
	 * response		返回信息
	 * token_type	token类型,分为token和refreshToke
	 */
	PROCEDURE checkToken(request INOUT jsonb, response INOUT jsonb, token_type text);
	PROCEDURE decryptSsoData(request INOUT jsonb, response INOUT jsonb);
	PROCEDURE encryptSsoResult(request INOUT jsonb, response INOUT jsonb);
	PROCEDURE checkUserPermission(apiId TEXT);
	_SETTING_KEY varchar := 'sso_key_flag';
	_REDIRECT_APIS JSON := json_build_object('aba26570d7084583b8021ab26fd21904', 'aba26570d7084583b8021ab26fd21903');
END;

CREATE OR REPLACE PACKAGE BODY "kesplus_platform"."router_common" AS WRAPPED
KjWef7K6jp+ro7MnqFuxTLZKLOJDNci5db2L9m6zgKM5wWrjBWGXUISjgX3G
I2Wbjxr4RMqkveLnthgwFH0N2VNwU0xXtmxjhb9oZENQ4Jkzfmedn/ePEARH
EhGcO8E98Bk13crwtLJP+Dsvq3oCO6XrmcbvcbN2eUaYQNvVj89UQL9aa8zk
9xl14IesJcvOEVnmtkmUGpp4l8eGSYqavtHvUwIH82fX1BN7K/8IhWGfq2qr
hJb2m0W9Ep5NoAm/fqReinNNgLc2enqesQ+1H5YrZBjMEDiEXzMJCHGiigpP
MzqerWrnpgdpvZ22aglpRd7br5ZI61fwFnlsilWUzREz8Og36JPbLPxQKw+h
ieVq2ENK+nygk9rDUWfxiaPzmNZ8ljcvLYTGYiTs6Y8lns9J3lnNMAYgGrg3
Kkhsvpq+049XIivsIM+IyLkMF/qy4MUebHiaQwd7W5LX/2jbhqXsS31EKH7x
34uVxkD34coCOZ9UxtFOxby6m20+2UymfPxHJVFqrioQeq4QtH8hM/SccgdQ
Z3BtgwR86HmX8vNJB/lDNlSl13yI+sZZ+4HI265QDifV1gVzYRvBczg/RPus
zYol2iqP3fFA4Gw+zaRowVHmaXD+qiD3P2JiHyUV5kZk9M9TFM8OPYkQ0Swc
AG3QBXgZQylQWVJa/+qIRExnmOpOsaNGEZMNAfjvoKTL/Ptf/MR0BiWSXEe7
Td2/QxTxnfp0JaxeETwXdYXy9L8lzG5hGfzRo2PDy/o3Dqqxto59IZBvaxXu
vadpPlUI75HRNAEHcpr+IRFhqcRTwxqniUr1bM5CrGyqMCi0yUlfx3M5woqK
uKOWJZL/WMhSkJpXt/PfxwD9D5RjCBOHefgra0zqH7Y4XsOYNYxZ+GHAHBPn
WmEmAxenwxsQDr8Ackj4S2/njTTPIPY00q8b6zzsZbMGWZFCxapUWbtdq0yU
ezpzJnHi390Yw/eORPWYva0y5+aecw6udl8+sUlHGhpuWYWfXnFq4a4mD1sl
q0HHS04jeXj4qH7LIKgQWTEulBD1OS3a1oXYkZo3/Co8DPQ4QT9kcq7Jl6N/
kNxMc22tdghsMtplp9dOqYD1k6iwbJefSptc4Befew3OmRmaAmB2s6nOTH2m
VjPeqZXwQhL5iKjmpdXe+4wU3IRBUBcceBd0Iu1Bg9JNjcOGAajdwCDWijm+
2+J3GCcuPm63jMxY9GPO4mE2R8QHyviyHsWD6HnVqAYQrQlIzLqO/PbbxT2P
lgLF7E/rd35myyJouFNSDDKwBsJ1K3T8JRuj9bGRFePs/GEMk1m/LRkPlQ3d
3rIujkWlGRIJSMR463Hly5HCy2uOkxxgNcNBZ9IekxvPJ4MWs6uXrGejjlFZ
pkCSw9R1h+UABnW7PQqhlwKwtvSV9BVe2t6Un8c963NvZzxxjftMX0tkv1ac
9owMM8j1bG34O5Xp+VR2syD+yIqQkELn6bbnb9YKO7vzD1F2yZC0Kkb+7gSs
9ZLsboRngW15ThItefY3wxDY5Qk/ZRDFPQDIt3vWyT/smQYqbcsz7MrZyUw1
75fmt2+85S6aW6xxa3GNbqjDmnwMDCaLHdfDNwKLILdohxMgDXy753PNmloR
ZFgE43Sw4jlrvpkvJeLR/DwXv7LjJFLe2MelZCPPHnQN2VP5E3GpUnfqhVRk
jWL1nxEz8Og36JPbLPxQKw+hieXaTcGctIZhiHjdlYqLMXrR+n42/dF9t09j
hMFcJ//4q2F0GrFUUCuSLip7LO+P3+xYf0YFCL+wuecoe7fJwmQs3uCHy4iD
HVy44lTYh2p20IJzBU3mcIq2iO++u9BlMyV5Ab5KA2qA5Ilfu9VptaTQ2Dut
LqyOcsS2zmn3Et91pRanKkO/CFeSufkXEyPmjE51kyyInZVVTlLjTLMtTaz5
DqV/Omcba9qAFwqScj/m9NmVu2p35csil5rTDbeN4dFNQlEL0yQxA+0RPbRD
NMwSdPp0mK2Rv6P2mdZcTXxhz0HyfTyYjLjPbpuxgD1h0J5nWQEn5t4znbLc
W97C46Gj0DBXWvAG1TnHL7CXhQ4wEzfjhOPD8+TmRlx4Sa/lCgF76iGw8Jb5
kHG0pqomkcpCfpq9o1xo5QyFS8KQ2wqBQ8/b4M5JesXz8WPbrLSmmp4Px3ii
mNlj0pQ/5BNUKDeX5oIvEd+8LoS1Ha34Eh6d6UNF+IDyUmehsDfumC14pze/
PphAQMa0DhwUQ0K0OXmUEDigB5hSpQUEpVOQ27Mnj6QdfsiMM2HftVFH03FK
nDtgqyMR+47sw354nL5KKJMmAt2xHk2osS8GihSYKq3uQODFTZxJQyFA7amK
FXZVdQrCWNbA+ugdg00EnUQAcrg6ZVg0sMmJwpYFUOre8gCfO0faMIoWFM7T
RWqU2d4Y64QJWRNAVsXhIMCxX/yKlOpiVWMq81yXNcUl7A3IJ36QHuwwd6jG
cS3W//dFBEIGFZcyDKiqR7rasmz+yfUS1CQd+7tZ3imwc9L2upnGtwF9K1+i
iOWe0fwqt84jNywYWf04P6pHIGYmo5FeofN9Cf3M8hfQlRWXYUHjl3rP7AWj
Rap2dlSHsSGAt8rC9WA7Q2LcG1oRwQ9kIKHF99hy3+s1AXSVNO+k6W4Nq6sH
XS0qfrZJsFOhyDISvgp7UW4ZGuK+0pcpmEnMXlMwlVA4kmRHSthRWKG6OV6E
YiGKU7eoxULQAtX6KYtblffOJmCilkZd+H6kyR5irufajDZGEyAB7gVEU3iw
pgC09DfCPTgRbICUxoREVl2jGHPsP1tIfapK6Su/ZA0zCTnT04fuU5o/V05G
GvCKPjVOhoh2IQoof4GLkcloqO0cyWxB0imD0Yzn+Nh9e7KUTYiGLy2J5npU
M3FWAlmQqzr8MLMBb+I6212WRIm6WFFBH/moYQziW4e+UP4LTaIrUUIYeecl
i5H76yV4HCY7fG9yFLTfDlcarDL1N8JyJiH6BgOvdlvilbz2bNQcpoHlBYv6
ErXenPp/i9Y1AxsThK5zZw+o5rNcnB/mYzC+akq1fNu70sNUGjZLMmUBz529
LVeler4zRqORKfXnv/zLjYFtvo58lmqD3vRRXNwWm37RyKuhKZXx+SPrUiY4
plObo/OHRk/RCLowU/T06AuiaJ2TWRqCVZQi0Z2+/quZG4tRkNj82hEGiH2L
/gT2kbp0xFkw/c9b1ykR54RFrxBpJLyZW5hWAqd6xO77vRaUPNhYcO5RuEjw
CfkLwBsq/VR4mNIwjM1cT1ZKZuF1kIvxYqKipDg9gRBU1J4FngQocqYQIGFz
76/4B4KU0L7+gAFfMznHotc/BqC1hoV8P4bmy18PySQLVqxlOfSuOfov2GeG
dbTFVBtcVFQ4hkorCr/CKPAJmtSar6YYskkScOkNlXTXtwOr5L7sBfPD7IbX
NCc9SAdcDS4S75TumJ1Pd30YG8pQCHvHSoXy5F8mbkxYpoxPH2bdZGY19v6Q
wIlNe7KeciOuijn2w6ZPzggIDxFG0ij7gzN0n9GUkLsAg8BgQXyD+XiHD3lv
0+lbqAhds9CCZoRjQhpuOU7POUFk+SPnKGPNZ1xFG3Vec5YEClyyGczKLmI2
uICFFelbqAhds9CCZoRjQhpuOU79+NjU8w4M0uyb+U0CNOyeO5y4MmxF4mo5
R+Lmi2c3AXISUV61ef/OymyNYKB9QCFr+WLmzKvHXjBw0Auxv2RnqHvIjfKz
wwY0EbCaGCB3+yjWeAHVOjMpC5K+kfkQH1WKcBzS/STSgNhNJ+nTlN4WW9lE
uyBlXbsvT34vryQdcJ8wu7OhI7w0f+fVNSsnDuqRADp7rSNqOay5Yd1D2YBu
L3FTJyxj3BTNDk/2vRQibKQdi1+Rdi2qlRz7a0wpsAOuQXCE8uJEQC7GaqXj
+8e78iPxoOvAvzI7vuaTDwccDx1TrlrJ5x0FFVH8w2hhZSJs78ANgoNUXdQv
IvAwgdEa++yo6PzGgawI9QLaPyb6EVkPf3adc/gLjzIM6xGsxg1+718ZdJij
RGUcsUGoVY/xlJaKdQezBku4EQEffFQCNdjAmYxdmZciJQRap5PSZAHn9LSs
Pr44E9EKf0EmOYPUH+xF9/RFuOq6F3QbXA2KK87tauLM67JMCtf88uUjo04F
PVL9P7FgrGv/OijaAxn3dOII7TiBDtmuBdoG0/JMlgCJQhOWddJa7D+E0ivg
loH4hdWvsOHEDwmmnDO3Hdw+ZIaEEOcbUNHi/nNKou0tJ4d5S6BNKfazlmUL
2l+Ye9ODXzegsw1lMiZzWBdX6BhxlPENx1vXh8Bc4s3g/J7bEVs2jDSN3Pc+
iMmYIGs+rO1dK6I7Ij1ca70mCQbjFERKKZGXSJtWaIzHtrfSK+zFEV8rhCNZ
GuIvloRDwJEx223oeSXTQGGig8zTvFQDg9FJhkZ/eprD+DA93wEMj0+n2aCs
jb+3zKhN3G+1pjxEtZVMOZDVJhFCXOiUHs1XOG5FZx04bp0vtHgt0a92KeTZ
hA7IAVM0vrJOb6VXHXERCa/5njM5IJsixvvDkEbuDABzbdskx5qe7U49rYPm
6ATM74ifu5X7HQugd3pEbJlzuTLt1y+h7b7J8WPQ1Hm3QuEBiGMNsCamCrhU
102wP1NmxBaRO4GnecnzmNOTmzgaZvKIw5/ItJtQQv9x9wsnFGP97CKbfFzL
/SGgzgvycDflFJv2M7oYJlg3LMaD9vxQtG4i0X0oLIKLtQWQ2meFPKN8BRsZ
PMWgmGrsw5DboCDlWs/LkkZA1gPr3b7hHwJ2mnla7wanHRODy8dOc1X08Zqk
vOSW1vm49VDBqC5m27oIfZSWinUHswZLuBEBH3xUAjXYwJmMXZmXIiUEWqeT
0mQBxFtwC+NhRKidI3pvVHkSUO1Zd5sdM/3NF0U28/WLkcgXGmyx2ImJzjbu
hftkMX+ge92BgUHuV//VupLtsZCE70ji9weWXAi+oemPsOexZ4kv2YVRUwHi
xfsseOKXzplNPKXyDrBwiw8/UB7uuaO1ivjbIEyealpi6x/kE6kYULExPN/O
czFuxc4Ggh7yWegzxY3SmU0EF61Y57dOUwNcgjsnfhfWki606X0qkiA0RDxK
FdygaBoWhnVbh8s9XHBa2Musp6PNxx0YBmD0Vt1y3i2JwNbGj/coMR20gWWz
rq1bWqAO7lLXCo7vGmvlemJDKkCouaVnR5tSoMxcRnoWmuVzs8jQT26+P7pQ
LJYs/4M6vM6Ukob1O4KiL7cTYvXC88Pshtc0Jz1IB1wNLhLvlDdqME7OtPKX
H7iUIK6It+nJm+PJbvCrpne53ADoDRJYBscqlMp9QEqfDWYWZx7DDnAt8UIW
NgkIKrWQITq1J24/2uf8mruXd5qhzlMBCqWIT/1lfbgviu96mX9X5k3kC3Y/
ZfIeYXYjC7USyuzhXAjLa46THGA1w0Fn0h6TG88n4YN337Uxu2QJUshYFEUl
u2hcIh4tBsM2wL3SizakDjBuvOSIbJnBeSwiCqcp/hOtiImSiAfpyHM/oivs
KHMLxybFyuK8+v3S0yJy5w8LB52bT7cz5jNPBiTV9MUPnHs4EpmfUmncxHDq
bAIWfhSnOXXj4bK+XPqP/LRkn+YaTPc9qkY9PUb+A47Jn1irM4Se5pE7GLj4
BkC57qW7QwAYaD+WggBzyy70i4R/d0346RZBHMLnRmR31yGS0XEqNjbXMnvT
iHZU8UlaHKeIBlwStTeLvyVG8InLDfyg2/vWScNkkkNtZUtzBQUJGGKeaSIr
U/tCQ3GfRAAY93cEhbpHQvlytFUgn0PIVKVlucW79T6NDg4rFnMfyDBi7WGw
AMYuVeSsjOTGB5k1U8RywO2tTUtDnIPL34vVY36GWjUdFuD10hXHZ//zCA+4
gXaNRPZEd3FR5iBcz6mMffEr8nsM5wVLd2yuE4Y68fgcAuK0KysMRRaKgxWM
euCc7wYGuHtWpseJQEaTezNsH91BmavukZdkyGdMxO+J2CJ5W3nKrLEWDNgj
iFfOJwSx0+ongJykqQRLf9low/0nyRCdjiJPT1gB35jfmPKnrD4q1fgHo33M
fXK9q43UcrZBnFPfVz6/bxXAdg7/yJW/2jKpqnn0JEgpH6ZMrb8oGI9CDTnW
eUM0fRVWXh1H3WtgUav8r5N3CXa4ew7BhfaWJw5i86Su2vDo79/FsW1A3knc
u/vPRnXgj0ABhcgtyACU8CVAlz0MfQnYhBM2FZlrNE8+df5VPh5Y6KhEFKW9
L61DE5ax5RJ1rx5aH9Z9jN4xWG/Zx+xkLdfc7gG8Q3uR6EYJsOP8NznCticw
W8rwg0qqxRFSn+3RhpJFbryS1bQzNFyvvoEaOpLeLgxPuavriCDcZaE1jHDf
9yd30jKlMRhYGivKZv89HYo5Ugr7+8FxnYIp5ssHY2M3SqBSX77HQWdGl20+
ZiJPMvZ/nNpxwqw9MU46vAS9vtlVwDH6SFJHKaT82v8AkSRIfMeSJ8CVtMBV
lg25+Jew0CJswGqjElXanheMOT9HUM76596rn4ax6QJxlEgijWrRDTx/MeHy
1Zb2JgZH+SJ95FBW4xTp3w/0vv1D2UESOkvbzg3W2O6mn2PLn9dMOXpUhDr5
1fwG7cCz+eP2DdS9F5edvKeIF6GTFpOLLph+NusR9bMMeHqzjmDFuPVHHvYs
93SEgA29FPUnTzUN7YQmAE+estN6OpHugDO4B7lt0AV4GUMpUFlSWv/qiERM
oWKYZjfZ7KN9ilebQSpTjrVhpDpugVbSZH/oIlazt8mfPj8z5E82SNK7FRRe
493ramMqTF8WcsDKLkznVR8IQhPTUNEBhdshzfHe3Aw+inLMtrsTOW4520ZN
xOjhHljMOGpVn6/q3qG+4j2SM84arlUHkACTjjVVZUGoGE/YIC5RjU0CNCl4
jdLXHV57dKP5yhaR2U4ieYWKTbG/u/L57E8B/mP/kZTN4SLMTZLZVuP617aV
TdFfTxrkJfW9j56uTP2IyGIZCYFQlwNQWkHEus8g1zjVJK3jMOk3v7oP7XiM
6cKoviIxbgRJ8pBuYmxjOU6Bfv62UqNJP7wNkPv1yBXLVALU0Cm1YSRfJd3+
etecIz8jnuNMXL398JHUbA623P74D9SLAKeeXiXs+itk0CLAftCvOgy0wvG7
aSHd23oH7th4fU6LHuIg6EoxoOKynKIMEX1Ic3bfhASewIkmQIpliGKBBqBo
6lEwLVSr0kmyFqk35qbfq/3SVhwS7XiZs/Z7fMp/IWAfRQeLqAeXEY1/86cI
E9kqz5Au/+EqdsN7Nogu8qmUBGWo2lEYu09Lkqyll3XF38es7AgVwhbQvU1i
gmoEC0lgPa+Yz/ivJZn93WBm8OZ48adPkoy/yQzuQhndxwOsS6CvCVLEf7LZ
Ab7YBTVMnHrnQdWEXVWcQBUG1A9qtBl1Hk2Kq/UaGJ0Dy7mqGxU/Ge/Yvtz2
JLrMcY3+0Mm5ZeM9RxNzklfHMjwKdV2nWH4gCx0fldJOQGFDXZru6je/k3ya
3PeJv80XfRZZklHM64ZVK+XwjMcmVKyCKNIokVUSwuwyNoK0VGSxXdZUZ+pt
+PaUytcvAkFl7PmHrFmGkkirODTVJoEmdi2bBMUGEM+ZAQ0uh7I0kSdqr3gL
DLdSo7OKNI73UW1mEiTyAGOJZvlxXhFNXRAWXqI4GhlMBLx1ivuPq4D5L5jP
28lelcvPP/7xyfYzw44QEPJV6jh006zbGSaRaf7dFekK29x1qe82nsceqoSj
r+hcmVbeL2GSuyW9EL9Ys7ejldsRA4FXmNgckYTCOFKovxaUAv6doK6g2wXR
sqMWHwHEEfLEz7oaclp8e4NRFiCohiT/74ZTzltaravr8//68TdI4vcHllwI
vqHpj7DnsWeJL9mFUVMB4sX7LHjil86ZTTZRvaA0WhLILJR6hhS2GRHnLpG2
55QQ3kbzxJ99PV1Gk2pQQ7KDJCniljw0a/sjcDq8zpSShvU7gqIvtxNi9cLz
w+yG1zQnPUgHXA0uEu+UN2owTs608pcfuJQgroi36cmb48lu8Kumd7ncAOgN
ElgfuZGmDDpINsZxWxTFOxP6o4uIErv83GVfZnc71ItEPAtjjXcLpD9kNXVV
mw4TQNf5B6qq5+bPGZ5qigbjJQ8Aj1NLdPN/kf5qVci7WLQXpSZJLWTm5XiW
AU+QdmYPgERU6u679a9KE8OFuEsjRN0p4VN26iPKcmDwVvSOKEA7yegXNQDA
xYIlAxDJgue/deWYVm+3SAvj/TVEDJIygRuhyrTWL+krQALBhHi98B1aMhJR
0dtFUTmaL2rHbR/LH3ifvIJDP2nysO+V7DKEUkjRSSih9su5hUe2ICkwOM6N
B/sbCcWEAP90X0Ohi/lEL38xxjXTnb3Cr/Z4lRRz3bIg4lz19CaFFzXzstQb
mYGvWzomUTxh7++UxLGQTJVsymQNyTNofBV6jKzfEaXPbhbnAk1MeaA/4LrC
VZPk43xNG9dRlb6jXDdepgDzM/Zf3Dnj1AMjJz9gVPlvjXQt8IrvOf69ZESn
AUyHcQS42PmRmPYk+8vdL/pXJ41GuhHN7TsjGpMKGChUNKWu/BxTTnAuSDXr
I59h8WvQhZ/fKHHonlljyiSPn/TYpMOKeLqiVYh45UO8j2+0AvBYApRlYOBs
Q1Ry40E4uBHbFFUbCrgX6kI0my6OmXtikKv3oReazR9X9tk/txdlD27LOni9
9EQ3fgBnYoRdlGgWZIkZ5tg3QaHjhMhV++loB5+QhmP06cWfJnElsnuiwgjq
+8BDkB2PKyCfX5jd1xQsXi+BN2vnAPz+2JYd5KGAtegyoW5nrrYqIXMFURS3
F+e0tGKyF1lCPrQvbWHhBKvOCyS9ubVFxOnk3gsg7YQin7B/g50vLge10EEx
DzuPVwJUnWk/S/V5ZeDDpw3pLjZI9KovLonMeeOaTqnqi9a+/zj9uSZpnCYd
RGMj8JgIRe3MNh+yJUtNkZu/9Slr7D8qy6h9cAJC4U/TFpSJT9qhp8cd1lYg
5Ig2S0gO1cd7yMFIqYauSrTgCPnalIKMi9n1iqqHZdbT6t/vJhiDEEw8kqr3
RCBKySwXB7qDNH1EGqsacVxhVEdPfcXY3Ikos3/hE4QIyxU2A/A/9Yup3HRC
l0x8J6wAOa8AXYW7+/a3lbZ9GBgiNXB21hJoYsyDkPDP2UCum0c3Uj3ZV0eO
CVSAUunvo1kARs1PJpgFZLerRWq3GWnIxTmWaH6XXZg0l1bjjgxWF0ypxyxR
DT0PjBqjbWbMWGyHl56p8SaaZ8xXS8z8Qb4U279wJJFSIDM50OlaEMU8U628
oNf30AcoASiDEtLi3Koz2pFOOZJ7JcYons9dmvWgJ2mtKO1/Fp7hvIaG4TD9
yr2It7Rh6QRv4Ew4eLvw4aLVZXiPO0wdSRUBjBSP/nSodmX7ZjuQHaBT8sf/
fY+/cGGXEKmgP5tzte05luMNuroonoFt2yTHmp7tTj2tg+boBMzvJDGTvNvq
whDvmvHbR79pnXOdEpDTE7mthxTVcZVrHrlW07YMOk1voYjaE1CYA25RvTRa
jcXTCGG7j/L2h2p4BOJScRW9IYwqN8BjM4BMmEx3CxVWloxZ0VgF8DDRLpAa
shDe+VmY2DOcJXIJiHMbkW47RexXyVikvD2x0qV2TD6cGMLvUTp8n7NA4NuI
o6YCYKMQgqSWL3pFEQly7M/fHJhc+N7W0hT+rATq6iL0ER0eHxUvNAdywDkK
/lu4TZk0yTYm1GBL8jpgVTfSpdVYlh3V+fxx862bhVT9ACp/tOuI0jnoNSXQ
GiwypJd5HmBmQUUb9ZXpAMP4nzzwGagUtf8wsDqTaRPftWsbHsPaCKMKg5cf
mq8Wq+mFO6g9GLnzsEF4dpnbaIu2v334wFYtzDgg+VfzeGL5gmcfM5HpTuDD
72KzUW/MqZZLYIeDdkAgIZs6Sc2C9/vKUn3kJVCFaRJ1RemLItVtzM18CE8E
l+k8NmtAqN0/pPh+E3EC/H5DpH05puRsa9ATDUbzqqbhpwrQT0r7LkXuf75P
rjJr7YhsA5ygOyiEDRVFJFXZ44qrf7AWHpqUSNBnJXZRW1PL4sguIxANyl7m
X+dPMVqdQIIZlXwUTNKg/zJ8iMV8iIHZZl6KqtQg9glYr+iKUh27uOtYjL3F
oeV4AB7sq2HnF1lX3pbLywKyGkwNE8V5AvoLixWeqh5c2L0i96/RNQWazXh/
kwgObPoxQzaQAqRRjN76HcXRJwHFvGEwwnGcDfycAafwYeGoQS95oQaQC6r4
eWsIFw8cgTzDq1ti+G/W//ukfT58XuEo306CgFKfBly1EkJX939ZbMWBZ2ka
r156Mm3bJMeanu1OPa2D5ugEzO8xmrEfSqrGlCIMqeT/RLzVyUck1IMI+Xtv
aUvHxmQZv2Cyrc0HkBduQjkzdJRpwNvtz+Wm0flhXU2VSbQVsAba6JeUQ8cP
K7yTV3kFAdaLzH9c74/aOWPJHq4bOFLoQZfP6uaXXV3n/0pdrnpJV4rZIqcp
dUzWsXSb0eYh+rRC+WCS/vXzHcXlZ9VBuN9E+/pRuaETmLhJcl/BrYmcmCgP
upHZVDsUcOeeaBI4/V2xMbnC2WfZuEMi8b1n84IysRXG1AOfEL8tEqctRkRj
ZE2Y9291M23sNtiHwZUox0U4bJFZH1EC4+BSRbT9Q8UAY4nIalchSh0lim9j
c60jR6PNCCV5RiBpYYX14m3uw2ADUD0BM2+4leOPbqdL7fhHaZuQYrmJ3nfQ
TRDvJ/6KMk/0Kks6ESuXnW0UPafotXD0Aijw+MC0YxyrIbR3oRykT41tG+a7
Vn8/bmCERY1sN42MQ3LoJUrHCbDenx7ZB8+v83At8UIWNgkIKrWQITq1J240
fKlN+v0pv26YeoX3Xww8wScNlRMZYlRibhKh1fZRxM2oK9AWzd540aX8gK3k
PtJ+6W+J/S8xbVW6Ox84W4aUSL8yVyuERH1hpms04REku2Yxiy6wj+VX3Yrr
/9YJoqrrabLw87m0mkeDLcD2DMdv5qI9fgV5lCPdDTzRWfVfw33GIARWI+nj
hqG7pvjgosf8tH9uTfPKvv5II+nAkBULdwQwOvJRhXYntpV6aRhAr1uJIrnf
mh3E5Dyn058MKcvHzQfqcNzMZ60q0XYInsgOhVC0oE6vsxJ6mMD9tqfgKVsk
PFk7I3PqQTpyw9A8Yr3WyAVP+n5ogDVWrGqqYS8kZ1oaEvjEMDfocjrZgfuq
svxu2bYmaCB6YS1YbG1/QLv7u1neKbBz0va6mca3AX0rX6KI5Z7R/Cq3ziM3
LBhZ/Tg/qkcgZiajkV6h830J/cw/RChkiUF4P8yvZleziwPKsFv0dR9JtH+o
Y9az5dEg7tBOHhWIB1Zj4/fCYZISBXwnOcqa3vo+QUP9pvMfYKew++yC3IIj
qTDl6Iw7ClnFFOpsrxDwbaBLx5BnctxPNnXwqWyg2fNuMaKFWkPEISpRTg8k
JLKvW32uE9bh7vNf4KR9OabkbGvQEw1G86qm4acgS7iQlXYcLVGPnmL6NPTL
JAF8Q2uE62b2ox45uQlUqMedoVSCt+3yeOWWE3Xx5Tk94gmMMemzuiQDlAIj
bO7u2eceoEyk9X30n3xzyQl+A11+QZgOPaurR+fxa6E5pNx2HIiffIPY8bKw
npbvv0J988FJjzPs2Ok4iC6u0+XKPfftl2vdSrOr67MNOzsV6yw/qsgJAs+K
UNGsX3FvrbQbUP5k+4ehvT5FN8+nGrw6gweUGSwr3O9Bv9SYmWz6qC0g10pc
muulJb3GFZ03++JKpXnk5QWRz4uLm+98/lQ50VjO5cfv6HEVc78R5q7NLuIw
chTvCXmi/S+v0KiiyAeiLtOmXum1mWmwvvc9pO7WNHy0NZrrMBbp40mTvMMk
k2rYrOoYtfu8PymnB1HzN1Q5+ctdRMeLbCakxd8kBKJGd3N5j1WhdaY8NQsI
B4WLDcTrwLV6mXEMKcsz8yYgc3L8XYDYgkkWg/qzEejhuP1UmAWHilJSlFec
/9nHQgGYa5mW6qQc4ioeRZOInfPoYQEKwq3GnaxQkzucSAg3u3nfAjrUP7T3
D71dZA4jxqwOHG6pr9v3azajr3W/4gXM1RyiTR1YNjmgnLtWim4uxVI1yjma
4xgsrKZsfF5qIZEqKFcpRQaMbh07v4s5GBWN88iVMItESm4UuIWstJFX3vP+
ciFPyuRnWzTtHSSoB+ySBHb+yJXHlW3EasTjO+g36RibZ156TZwGqdOzzyKK
vXRaZRmVfBRM0qD/MnyIxXyIgdlUVVThcmD2m0XDFDvtcI+Udf6rFVjjJRbM
mq5vBrvs9mYxVfXx2/neVP8OZsAkVQVorWdkEwp3FSfLYUpGsGd8a8Hbdw0o
ZNNch4tiBqGWFO/C+p0mscCFJfcyl6TjYcntjJuWVV3YNpN+MC5k6NuOHx6e
801rLqnSa2k/PP4HId+cIZzAyPzL/ZORV6zNeNmSU6bmqZ7Cx7uVHt1UIYm4
EJ+fbiLS2B4FGbcExiorfkAun/uHAujGAcpwuVYKAA42N1Azz0KYGi9T1gJW
q+2IRvMrtg2bD4VH3XrbQ/HJOjGs/4rty0KMyq085pI6RMtLa9hBi6+v4p/W
tjHiKBXXczZYZMcpOke2ZoR3SrLwHVSdypd9bK/9TUfgkfy16sTvwvqdJrHA
hSX3Mpek42HJ7YybllVd2DaTfjAuZOjbjh8envNNay6p0mtpPzz+ByHfnCGc
wMj8y/2TkVeszXjZ2bVFYRC80un/sQeYMKYpJ25ZhZ9ecWrhriYPWyWrQcdL
TiN5ePiofssgqBBZMS6UEPU5LdrWhdiRmjf8KjwM9HdBgbOz8jFoZL2XuBhU
X2flhncXY/UEN9jvn9/ALL53y/XZ5ERaUtYitoNlWuuhifmRvok7OD7EWJb/
MW+CPd73bIMT0/JYdCHbUYFfjnEVQMlIEzLGPu5EpjIL2zGD4M71ZMbYBvOU
chlysbr/akJ1+sBrkkSnEEsf3OEYboIkFRpVnr0bi0g3f968BfzlYOKQT/sv
dYTb4ByA2qNgSrpn4gl1ArsDXpJpx/t5Gla4/MlYQS/Q4MJk08HN1lVo2usH
EIEEZDn8yTEjIUsf49J/xOjs5cSCTH5XsWmm/iU5oILVVGy9FYWu6ujWex3q
6DUhknilT6xdVQuKVCTClv8CwiFmPGSoSSU9mkM7tGp6A0724IxcBw8urZwq
zIceXx1h8HbHYkkolDAlyjRZFVB9IyVNW7eCvNknPEjOZoVKX/D3KQR1dqxn
pdKFRxg+gJqJkFJD9o6o+XlgGbcghUDozOzT/FJP9HqBvC79bMHpiunKGsa/
4KjpL4pwyMf0blr5rDspCgQE66BTgrryy05BWCT6fp3O8vbWZuTjSMXLbq6Y
4zys5fuOGPKqkA4IBZPxn5PLWdArgGDrxSSYfT5TOuJLGgbJ+LC1xdsYaGps
DMHTf65G+Qbm1Zf/t1HW1TdvxVW0VFIXLy8BCPrWts0Ta4ninSDOYAv3YyAN
CejugUA1iSxRG8tfocrmocTSw1EDO5DNSNn1R/eZdu0mcrjDW381xyedUGbh
XPXsIVu7DgZ0e05RkeCJllgwihXQoXx2xSJaa3OQLG/tTTKiU4OFyTy/POgq
TdsKn9GQ5xHm2+UmvU+PcrPAXXT3dh0IsBUGBEFC6pH2n0U5CjNoE3ZMTLsD
FleuVeLy4zOzVhIszkzNNji6T5r0jtXKhXYCLaub0bU/GRqvqubV3oYoIdTg
ePZDLTrgQLEsp0az82NYw6KBKmtAtWf+M5fNsYw1nYY37DGYOcvYBTJFQ8UR
0vCn0gi04g1TvxwoMfS6kF9P7emSNDW59oljD5ecnpP629lc7pZ+nPquvu5v
q6Tq3W4yzE9nr4v5KS3zWUQucO8P0u4L2cRuFAuYdQvpNjQUcxXw6lggnPNd
frh4yT8P7St1i4E0IeXlZt/yXzH98vcdDx6L1cAqqOCmp9R4SfgDMOasNBy9
cZWAPB5ec8b9ytXFPXSqTJ+15wQ/uZXDYrp6T+2/dsGWOPmqPU45FmG/eqYb
RLeHeT/kS1og7oQoUwO2byR6T5zzhDs99y5Zdz+Tm/rLL9rTovKu6vgh1XTI
cJFJCdCNmn9ajlCvSqAHt4BtNGkmYu46oun+wbkm8kV2TRqOucYVLg7KbSEx
tevoh6uAO01joBeCU6d39UFfKx3w43KB4jtoaEXrW5WPNreLGJ/cT8UE3AqG
lXJM+xD2rgBzPPszdDssnG0Wi7cZ8bmPRLrvn4+82dUHk/k/ODukpWUufqUK
Ty/u8KKVFnJggmR1tOB/WH8ZeVxGAwKdxA1mTlrRJTJdhS7FDgat6w7LQngR
v0jrlfl73QHnxJ7blhEz8Og36JPbLPxQKw+hieWCdwOzwL0hVcyyc3HeJhPT
gH1B9TlCb2qBspsaN7U2BaZ6pped+9BMQM9LQgXwSxPT8jbkSRBkIZrBwwIQ
uP26yBQJro06Y0rz1H4UwuCzZVtPfaS+JohqzMcwXrg7iyYXWPPyIA1A93Ce
81dxw40Kz9UTumnkXhMj/mfCes5I7guveZb3/Em6cPONPUqYdYap91XWyUA1
e0EgjEHQYEOpyuzlNPaxjGTuQKrU2tMXTkkH+UM2VKXXfIj6xln7gcgPUIVF
znioWKP4+tfuZWDpenyhBaIblds7G5jUWk/F+fb0+ezGh0nIJlFT7nwM7Xyb
kqGFPWYr5AIfqe/pQEu+jEK8pSkU/UZpSnVNZNsxIe/C+p0mscCFJfcyl6Tj
YcntjJuWVV3YNpN+MC5k6NuOHx6e801rLqnSa2k/PP4HIVTIvqpgaVLj0+eL
P8Yz4AAAdrj/i8s2npiumk4TaowDmuBcy22Bycvx7rqMc3Nyw4SvW67Sy9KM
UhNSanGkfqrZY3Tg/xcz7fWiRUIsI0i9AVlcpN20b6CAWu2mCb30bJhc+N7W
0hT+rATq6iL0ER0eHxUvNAdywDkK/lu4TZk0f8srdesEQlHJynVzDlkBWnOV
jzRCW5HOimxlr9BfS98lxwsbe9dh+5bmV5r4XiwWwt6UHpfmKA4qS+nIxPCm
reqTtWkvacJYzOV21gzfEFBtAsgj65AADE/GyB2fLfWsXNFXrQzKPET1eson
uQQThjPTH5WDEZS69uQtIqG8uqS0g79Ng12IhKrQYNjOCDvd0As71T3lk7OQ
E2ayZq5Gv3Jo9NzYlOHIogK+u6jMRgx+apBhRel90GlZZ+a/GQqT6vJk090F
JCBT21o6aHxcwk02vcT6E4apWl1XZTeQsSszcVYCWZCrOvwwswFv4jrbTRID
kRaVKxyoi4SrDZwTq5YkI+HRgJ0ZgyQKY8T5ri6p8SaaZ8xXS8z8Qb4U279w
0PchKHHFZLvBa1CTHdRekLPRCgQDpyTtGpzPhuBv/neR4DvP2MwZflOc/NX7
jzI2kQXkQ5mhnbs0Cu+HB9VqIRipGZZriGSjUqJvikOVg7pObn5/ZuVm4bFc
R+NKuzk7TZYUP3H1yP4Dq2bcT1gKaC7kVyoM2a7I9e7U2ggJsHZClmnN8U2R
+i/+9L37RdcSPGLWXxjW8Eaw6oOh6m4vZKD4mZcYfwYt6T5kBq/v0VxQcrUk
zrUreYqqC7CeKlN7TTZT5s7FvygB0w8vR4ztQ3MBsWrTqR/SO+O+VUxKLpuB
pFffEoKsYAzm3kgziR2NP2vvr5iz+RKPvRivgG2UvJSxRI7Z5Wi7GaaV5UnD
wPWI7GyyzDwgcj2MB4p927mX13ChSdpBRHm/xxljaxq7Q8kLdd8/vj5iHB7D
p1aaRwTBXITJtxFbtIBkdzNgaiWwoxY/6c/bpkrk/8JVgf1k27vNL+Y9TGnh
JSEwyLi3RCabJfGqOacBdBnjJAu0vuSfcX1FH87p/Mybw/ejc6DNqZKZeqXI
wpoo43NHi78EQ4Iy+PihKAGp+kkfbs5NcMJEv6wmj0KlIJXggU4SdjYIR/RS
G3kXE2Zbt6g+ZzaA5ZSvWwubfLyIxf5s+GJu9caSMkLuYzdU9eI4fcNf52C8
c0Xv9sbIfwlpvYVlrnTTLbuGMh7cfN0icLT3NeUBAl1AMRGQ/DcvGaihoYv+
xO0Yet8VA0RSAciMfGdHoEI7QTWogARbo6sfrkEaEZ5V1rjobMTEn79GrYq5
hvpMox7EAsZwic57eL6pwJ0m8xcNOk2oy/kXIfAFNVGvD3d/kvqXEmSB15l9
IGWz7J8gdOK7LY1FCwNQD5F5R72nvXAXAmTa5x4XkCd/Z7b0U0D9Gqn5alTp
lyZHxr2sJD+IDSNrinRmp6ywCxoxi58mdXUcvCfRy74y6zMrIHF/iLGtESuf
qvVAvWzIlXa2PFOmouTBO/uyqR/xbv4mYjP3R7impozxlq/0hvcj+q6v3ZoR
KnNm84C/vNCVaGBNsplLPuyQEey84/xo/prml4au75kjMPqY1Sb61MyJsgiy
MfwBdWtHJ0mNHlEWi6xJr5Si5twMXAgi+m73JrDfiB+/Pm9LxLzuBJNhIlRj
fSvV8k0HU5Z1ZVzES57SLiVP1njer4Y3duYOAqAbmUady6AUmbYtxq3ApD0z
jNeQdRN4OvEyKtUoOSIpxStP8pJxZdfC3zZcBGOyugCi2Zyi+ls1UxVQtFgi
whDvq6vbwNLcGt3Dc1dLAIE7m3Yg6LQptNaOgE190vn/kOATj2nFOEG3y8oE
ZQBXr37lttO7wcdUXOCB6rvAIVvUkwy5DTQ5z9Wj+ezyUsmdN0Cv98hhHyPM
qITfM2e34YdnrHGZDKfdvKfayvXXJDpUMKfRvPgneRw9YshyKjdvxVW0VFIX
Ly8BCPrWts3kYTMMETPUrUmjwWoxVa9l++C/F20derilV/4AYsVie9YGYziq
b+tRMbU9gNc9i0AQrVTwCUAYsWCiWIW+VMog+rJRytSVUoIE7FclgQLWHqFC
9RlOk7Uiy/CePwrjcSMk1qBMunGHZvgecmOnJAA/WdVvbQb7kO6plIiQu9mr
6avWr2hKLYXAxEq7Fa25RDokfrnm23oZBJKg26FbrofT+K70zyA9cBf/o4qv
hnnLlgsieYDyozwd1NuiEvQnoSWQAXcNLw6E7tW1IeZ+GmHqBbqMjqJUa9k/
1cyynRTwk/u7Wd4psHPS9rqZxrcBfStfoojlntH8KrfOIzcsGFn9OD+qRyBm
JqORXqHzfQn9zG0CyCPrkAAMT8bIHZ8t9axc0VetDMo8RPV6yie5BBOGXRah
OTQA4pwBt/ldL4R5m5G+FLkp7SGEw+hp3CiP8rMH7O1dT5pk7Q3AmGl85Qph
but58lXIr3waKs7k8buHH6MWP+nP26ZK5P/CVYH9ZNur/ELSb2p68+2ZhMTO
Ggcpy5KuCBOaf2A7uI8FFlTG7dD7QrPei57HwDVjSdtXOeSY9V4sZioGPFQ5
S6NO1iq9viGyo/FTHgys3OFUJcFCz2f2MHVEsA1KtAdAM4dEHvUiAJxkHFcY
HRScBzyG/OM/esIf/tPw5e9QxiiUwPy/20tz5UVyNxDkuXTg8iP4bDt9Pmt9
7vtkpPLc2u8goWcqMkLuYzdU9eI4fcNf52C8c0Xv9sbIfwlpvYVlrnTTLbuG
Mh7cfN0icLT3NeUBAl1AMRGQ/DcvGaihoYv+xO0Yet8VA0RSAciMfGdHoEI7
QTWogARbo6sfrkEaEZ5V1rjobMTEn79GrYq5hvpMox7EAscCGi6uuGfexW2s
SitrtqVHsuBMVZ9uE0GeZJzOgvqrdc2WXrSlCUfemPiKow6b+KGVAbz3USxa
UdQtu7p8fuEb3y59xoI8oZfLXrQf+dAilDanIxUTBPgi/zCP8VXbYnGI38le
N7JCp7gQyaMVWgCCXkLSENoGSkLTLy/6/42udfrAa5JEpxBLH9zhGG6CJBUa
VZ69G4tIN3/evAX85WDkLfXbkPYWALqCAf45/zarAvJBx44VLVLpmXDXJrN0
yMoouRWsM6vtev8/zh6iXhj44DyZ99SWeLNpgdIlibuKw4lyP77zyic4cPfT
d2kmXPzlui+z7YbBbcRO/sFgmy1e07mlkQaULC4gwsKwe0KJusXa3QrDRNgr
3WzQUs5w4MqV8bGfG9RaoIoAyEZM2OqNtgyRn/hc12tyI9LPPzH7pGG0BqWC
gHpLOoUWD9/N9WkR1IY8bkg+KYxYflq+r0qwhT5UexW7RZMZR4k3NQBPwr1c
k9lvUzABSKvUl4aU5RBNu0Q/kpPFYygxhMELoT4m5KrBoEn49UspxH7vEzKI
VSMz35ArwNHH4vm6HUBp0R+5I2u6O7zgYndqWmICMx7PII2E7x911vpaqyeT
pyTCotD7d8neZdn7Kc64FhaEGYE4Oc4X8udlL3rc00FRE+qZ5eDeAOXl2v90
XaGrRgGb5yFJFaxE9cq0awCvmKIhb1RFBgEeKY3Y5ruhfSBBJF3SX7sKjOIm
6mnkX8DTdtw2pGG0BqWCgHpLOoUWD9/N9TtiLQLhyItl5J0nD8mjVXaWrVIs
cA60gfNHU0n5Eymat+in21eXHDIeXtpEDAMdo6xbX3cXeOhDbU9G8rz1YcUg
e+PWQcBGmNW5fmRPeUzz+QHsilSSH/LIj7v2/jtxW27refJVyK98GirO5PG7
hx+eUydlD2ACa3t+I+mWvlVcew/baNmfIqZbDRZfp8jeyO5hDvbIu8HzyxUR
gb5aCQgv5x4DJijQ+8IJunLcxqW825hyEhhmpuViu9HdYM4DUQ1PT0hm6NAr
EE0+uDp04Aeg9Sckpb7IY9Av8stZOUn1xY3eEsRYwpGHzuqtIbnxEZwRsT2q
e16GYQzi9A0A02YN0NaAMd6Kn6h2cVsOs9DAiNzGcWK2+p+YZ3Lnw2PyUpBo
+AZIWLvWWH/pGWGGog9ykCAPsnGf4iuu5gGJ5KYQZ3qc0BFvhZlw5tS/2F8l
RdNFkYS6DLr1jF2vxCng6RwfesdlKDFgoTBttYs5QzshEUo8EXf/lQAADAgS
ciIzkWXtKFTGOwSv7g2kO0LNj85HOPliU5T0YwFwMNGt3SF6gZ28hMLgmJV6
8hVkzlQFQ911+ax5eGrg8gpni08hl4/USkzv6lwilJBFlGkUIzbZ6ofWBn+x
e3CIFBA7/DiPZaDMKfKCIeNcYhgewt6qfibZf89qWub22Vy/I1hzqrmkJZrE
odVwUyot/CvLD1WHM47kvzyYRAYtkoGKQcXmWuadm/I0ybJqKce0UP0Nxphs
9PxKcZVLgY4buDReq9Ujj4z2tXTNxgmwhhRAENvMSZcZyKZ3VZEGKyBGeXA2
5OidW8QvaSGKI2rKhlaVX9T0t9x9YQDt35yh6g2bHGp0jpCWqYHM/xtxo5+y
JCGLPzKnAToUJ7v2t81VfctSvQ6s8tmiIz9zonfWyC8o68F1pPSbK+oxnMPR
ScEb5di/f8kQuIxZmlyHBqftonYQKf3VLMXNykyGdvIP+bUYJchYArQ6H1Lb
XwfDq3dQRq7Te6mPETPw6Dfok9ss/FArD6GJ5UjEqIO7cIg4BTy//4cT7mPC
q+Zcwr17rT5fuH5tG9BuFKlUJf8Xq8oiEib0LGzy8adle/fYFGWtasXbNVXE
VvZPDvu1RQJFheFfMT9zUV2ZD+RlbwXCuAS87e4aNUEl9lLCzegX2QBYAVcb
17OzyXLAJMBI4a8aPcm8huhTSaa9
END;
