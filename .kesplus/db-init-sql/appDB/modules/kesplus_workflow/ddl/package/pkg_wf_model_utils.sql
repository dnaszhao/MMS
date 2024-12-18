CREATE OR REPLACE PACKAGE "kesplus_workflow"."pkg_wf_model_utils" AUTHID CURRENT_USER AS
	FUNCTION nodeExtensions(bpmn XML, nodeTaskType varchar) RETURNS jsonb;
	FUNCTION attribute(document xml, element text, attribute text, namespaces text[]) RETURNS TEXT;
	FUNCTION exist(document xml, element text, attribute text, namespaces text[]) RETURNS boolean;
	FUNCTION xpath_count(document xml, element text, namespaces text[]) RETURNS int;
	FUNCTION xpath_text(document xml, element text, namespaces text[]) RETURNS TEXT;
	FUNCTION renderString(textExpression varchar, variables jsonb) RETURNS TEXT;
END;

CREATE OR REPLACE PACKAGE BODY "kesplus_workflow"."pkg_wf_model_utils" AS WRAPPED
Uwo1Glnamjm5z9MQnjQl4oeM9HSKuKtCMbCPCAu9NF2WSYmVd4Y+pFH3IClb
zSVh2b5i5UM0z82Xy/d7BUQCrnxvWP9EN3QwjWLegCFJs5toSXrlasEU1P06
F1PjQGUO645NC2g1ryqZlWW2Eqdu2zLMvyX7XwIEGVcRXc0CslnIpbth0h62
2GRV9cyuvK47nRk/TgEioJ+vA8BwWO5G5K84peislsGH5TMnww2d8Mb0wD1C
kKB4+rAQpoFOVEh7Lz7AI/cgRlCY2bQLi7CgiE1ioWMHcGXHjad1B/APnu5M
uGAoFLh+j1hgwktfU0II3nmiByG/HkLq4V8ttKeDcopr97UQZXoFKrPPo7GX
IFIDpSRk8TAO6L1vJ3vwm0sQSw/aC0EjmUdDE0gTYxIuy3N4oNq2bQpSTqjq
L7geeMvubOCE6azpT4S5DK9uTS8AB2ttPChQnRR4YavfdPMy7BW0+4o1bp4C
ho7gC59833oTqJ8uhlEjW/8oYysuJ7wSVaI5+FOaMU9SBaLJNoCutHmCjAw9
BkaIxra/d1qpqVhxoNfNIigrjM4cRUf9VYNwvMlwOCVmUWg7IAc/E3HJyjgt
wG9zmsCuI6XZfGbtvRBKoYbH1I8W1BZ7A1ovTO+bCdxDbRN3kORthVce4vbk
f2xikUWJIvabspgvk40q3weAtCsim85PMUtBcIixO8vDz0H0lSQoaskbgJgP
wmbu60Cvd+vuo3xV1vYxTIuwaLXMFq2ZRTAvn9KNw9yS3p/jRqdFh3Euc9ls
mPx3R16hecqL3jeqLPUf4W3/M/3OndvTdzsJ718ZLObTaWoDq/VZ5gG6vow8
WsEw/VtsRHTkkVkb46W50H5auymGrLr/4hmlffoCBpH7L2AK0p3LBU/TzB5c
Wd/y11AOVS9MwwEZJY+DX41yJvO9jNx+2FCWNlT13GbXc7W6RSlVJRwXRuHa
ns2NE2qtYvTGyxl7iEc7cDC6gMBvfVAq+Xw19dCmrAC/yQMPRVw9OKAtdMTF
XUTFoEOXDDoPFI5LWykRz0binvI9zN68cvGCZJb10zYUDC6J3xdGWhq2Rstz
H1C579tgDq7E/ZNVKvKQh3Lv84x3p64c3xaO6L1BzG5U3JCNfsTmlp3/qUrq
mVIsc5ZGrA+RJ+JvMq+v/5bzy4Z0W4gWO7QdPQRruqCs30mmJI1Ksz6N/LBk
f38rqLbEjdj4b+69CJDZmXNylFV0GvOS3O2ogvod6ulzh0ideJXGZwBAHsjF
rrl/ymGP6Y9KIFu4XTQsOVNb8Nu8DJA64mCOGpoGcbgAhVQiCwSH4XvNWcPx
cNBuvOSIbJnBeSwiCqcp/hOtJfGycMMIBWb/q3TupZFB+WWtDR9NoZrEsr7+
x8BlniqqtQhGLmc+3Ir321zyCuO+fkePB5KBCrOtAXBM67yfozubNLqaMqtP
jo11gwUGtGO1OR5mZcGrdHS2kXR/gVzl9WLAi1p+bkG9NbA9yA1qB9x8Xbo8
zATJQKQVAg1eDI+6sV3/ANPaVhDsZ72t8x8sfEsxhlau6rw62gAmlVEP4fcd
dHcgS3fvyjKrkJYSFzX8ejMxNxdxOiCK2D2Tk2JlspYyZI4SsJZ65mImZkYz
35GFhxdUVAJ7nHbnqXV00mKFX7haIQQZV8EeCaUjV2p1lCZZjox/Y+ai4Q4R
rwrnyDwDH+j4dNhog2+GSqKxNQjtUQLH0H0T5MBjUR5unxFmOeV1aCLs9Ckz
5GkAn1jG8ieEoMKJRVcRYqhyq1oCCZNbMt+uwlWBa6otVwpWypS8+brSU9hH
edsGHCwjY1XVmZz0eOjY/flHhl0QnZCUxY1Lba/aGrgmICIS7NgF6Vz3YxQY
XxFUEIXZDlHPXK7FGmeWru0XVm5nsvS/hiKo51uEnwL7hkTdXbpJv4rsrF2S
Y3aqlxKSPI0MZNIC68aDdrTRmwezd2nu5NzlJT2I4DXvUtZPk6UMVFRfhycN
K93cct/gpY4Ej0/zPSzJlVQnBLz0NQMT9Q5JYhW90qXRiOySojKwPib6AtlU
FdxHwioutK1OMc6ugTjNGsPfwYnNqDXNqp6/XlkW5MZbN2t7asfadTfmXLyL
vVhUL9jik7j39oRTy2/kLjNM+HX+JwsvTM5bvMtzD48FYLSJK7vTSiYjJAg8
NPu1vWu/kbVcEXWNgMT5n0m8xN/pknmpABL+6cFOUP/flx5mZbWAlHiU65to
xhQ6IGFdqopxN3VqOdHXH14Gfe2PU0JJ/OD+VN6y+6slufUDKX0pBxap6ytl
eMgbhN8OPrv6wxiZUtYIu5r1OX2JWmqQewBrTBRVNLSutKhkuVUbN1bWsV/d
iYvLUS3tgHuqHqU7PrG2bfpt14aWu1Sx6/nz9BdcfndUNxNsFfT3CDw4pcRp
YAFXusWmmCeGryWlrVE0xL/tyFwBzVsD1BGqMULFrxl8OXMNUYQ3VlRmzIfO
j62z3vpI8MOIiMb0YBrSZfpk/B0FJIUD2KSBNZN17HmwMDfw7/ux9wjoafa9
JKfdKRDcZ6BtFN9nJkUceNYlC3NPmkTUPyo2wsT0twAYmalt0CZbiuRH04tV
kTFB4p4H9hZRHZXDmXUqe/dOWLjOentMZRvbLVU7nwpfDzkYcn5KMwtB+3p0
79V979xRwwZIjBHXLYLAIDVUn55fw5bag+JFUVQJ6K/gPUIG7n/6y/JgmhAt
uje5PydBdEjI4OIpSzwjQYj00O+J9DPUEaoxQsWvGXw5cw1RhDdWeYQxaZ9b
L0QQ6EhgMcGELF5P23mJ/2nj/j2pW4jB+0uFDdY79uLQZBCM02R3F+/QcT46
HGCGyoHFjk9VeI+y18AVw56wjXmFuT+CLPs9uSq3ABiZqW3QJluK5EfTi1WR
Z8ecw7BmngaT9Mvrn0KciSOgsqPMS4cjZYdzOcAX9M12NLbpqJxPruAbinDa
nFuKjJlRk0UGUSTQu8ZNuSrXS7Uubgji+cdkLdXP5tGfUSncEpD8Sin/rzMV
Eid3bjhl5Sp3xvTn5qZN8bznjOEqZbzgraWX9Z7Sg5o3W5fA6bvjy2voWehM
03hP8Ja2EfRYu1Sx6/nz9BdcfndUNxNsFZ4Jl7/heph92XzGIFdw42qGryWl
rVE0xL/tyFwBzVsD1BGqMULFrxl8OXMNUYQ3VoXf+EbZwsnkRJyajxhaQXWE
Rt2q07izL4QJdyt2/KYPmckZ40y8ob2I/jcLXN/av+J5kZfnqE/ns1HY461s
9z4jJxq2dgGUYagcmHVYranfKmJlxqb7pTdg07CqYUo6i/AQ3rbmvmLmur+Y
Z3aqCfM/CuSbvMhrlFIlhtdSwtSxbwd6zzpDBpzJp/olsINVA15AMf+TC7nP
QgvjGkEqyujs3FAQHT10xzn4lhFPSl6/dBEZ9cB8rRC9ltPW/EQ5Fm8x84v6
mAZv5DCdDJ4QRS0cTsqCdBjp8FOyHjDv50l7eslSn63bGiKeKU5y8eLPRv5r
SWAC2ckqOl5aGNqzHt/sWmm7oFBDfvdTsbmDRGAVu+n1tcq3lYS3Skp9RAl7
hi2XuPQwpqe+RuzESIADzVV53xo/TZuOfU4YIeB7KnwfsgBTZXrV6Kw5+fLp
1Wf0SPnLvQNThi4H6JQw7ejG8jchyyCqpP90kWwjthAxYRXwzgf/wZNolKk/
LcpFj6tWLShyCcLpv5aFL4RK+VteKihQHMIxfsEac/X/HHmA7CfB74s0LaNI
Od7ZJ1QdrQLRhFX9Iunz0zPswveYLBvwA9Mamuwq4E2gTipa4GUD21+AcBy8
MyqU6EdS+3GHiovQhUALM+EqTt+ergIoZLGolZh64X81knShyTIsFcHU5VP3
kC6ajyyRR7ToyBAt4toc7vTp12TSxO3Wjbw6pMXHli5vJOSNy0/lrZq1vtKD
FuDNb4JkGZNwTaVBXcWXDFgGaHl4Zf7LuUVBZO3TzvrJayoWH8jjdF0uJg8U
ybd4UIMUGDse9KcIgMETmVFKVLbJheAzcU9VH1z0KNorcEiWDzBtBa8rkMhy
TnmNVFIVOpxpsW4k03No2JJWJP8SqzZgdb3V35eKQNuH4Dwl+rOi+JOtxI/G
07YVrTtSCla2zW4sFhFtRwopEOtb/DgD14rDt0jCbQsyICDAtfy0gcUjjmOQ
my92Z6U2lfcccRiAJIPYcU+Mk4DI1NF22VqMAziY9KiSWut//1Pj5WY1BFB+
bhFkQ/G+K/i86JEwzcnkAPn7SyiO1W2UFT3Hca5MUvl38eApBew2RX2mn8lo
oOrCDxPdnnH59ibBMiXxivbb7GflhU1uHM8nBZgtSriPCTTBpn3YtB5TAdRV
7twGD5jeCsoHniOlJ4Z1oeDwFwlmZRRW7uuegzkfjgFFDwmJ6y8oRA==
END;
