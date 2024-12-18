CREATE OR REPLACE PACKAGE "kesplus_platform"."kes_plus_pkg_http" AUTHID CURRENT_USER AS
	TOKEN_ TEXT;
	APP_CODE VARCHAR(32);
	MODULE_CODE VARCHAR(32);
	K_SERVER_HOST TEXT;
	K_SERVER_PORT TEXT;
	OPTIONS_ JSON;
	REQUEST_URL TEXT := 'http://%s:%s/kes/%s/%s%s'; 
    REQUEST_FULL_URL TEXT := 'http://%s:%s%s'; 
    FUNCTION GET(PATH TEXT,HEADERS JSON,ISFULL BOOLEAN DEFAULT FALSE) RETURN JSON ;
    FUNCTION POST(PATH TEXT,BODY_CONTENT JSON,HEADERS JSON,ISFULL BOOLEAN DEFAULT FALSE) RETURN JSON;
    FUNCTION PUT(PATH TEXT,BODY_CONTENT JSON,HEADERS JSON,ISFULL BOOLEAN DEFAULT FALSE) RETURN JSON;
    FUNCTION DELETE(PATH TEXT) RETURN JSON;
    FUNCTION URL(PATH TEXT,ISFULL BOOLEAN DEFAULT FALSE) RETURN TEXT;
    FUNCTION BUILD_HEADERS(HEADER_JSON json) RETURN JSON;
    FUNCTION RESULT(RESPONSE JSON) RETURN JSON;
END;

CREATE OR REPLACE PACKAGE BODY "kesplus_platform"."kes_plus_pkg_http" AS WRAPPED
JRg2h7P8/vjdlgRpsm7+Xpqrw/Ev+Loo/w1pYxpFFyw0vNi4lUKYv8jVSUrG
VwQOdPPbMoVu3SxHId6s3zggRbVrNDCAof1REDCND8ZaYm6Q9qXZM786SJEg
MGWX5BfuAcnjIB282a0DE/xTFQTTwrn6idkXjaZRVSU+5M6uhtghGtB5fgA3
5LSxBlP6Zbro9NuNrbSq6ajYD1wPAHdP8RAJ0fnFnDhPgRHTCof2iYPDK9ji
Vm9Wky7Pp9vujwvzC87G3EnFmk1QN1+JXjUqhRouZ7Hs3s4kpUL1UnThWqHY
AmNFMPPkzZFUmzSfYIXdmyhk7afxYofF/GPaUmja1UFSa14vK6GirMiunOvI
Dny/t03er4VXf23wm4GUFCmJF4uOcyrctldBgdJNwtAGaZYHkUUWv/XXuW6G
35EPOWS8FmMSkGAecg3+OWRcCGxCYq67Tss3Zfk/mnJOILL0Q+ItGHnrPfyy
XVrT1ybpdGSyf/DMOiIoMi16WVBMIPR4lgeRRRa/9de5bobfkQ85ZCB1Cw5K
f1Id0WHYuCbcyIalQqAeCWN0hdRvnhELdPu4ZoNloYCXzpJUD5dYXRfu8sCG
3OoPkl10XtsWup+TZsd2Bk5S9u3NlbPXAiSXY2qnmJ702+nfyFqPyxBhcK0h
ohHNKcOBBiE1ntxNwwDWRAI+E2rlLXEBaMmaqVhOQrpZa0hwIkJGgMJOloBb
G8I8iGTyE6qiePJvFlP7SivLaFdq2AQEuV5HFz7DYYRd/RgkQyXM2DO57uzI
F+PwFBI9N6cLhV9GLaRpt5d1mtWWXOT5HPH5v1LcC7yM/dqn5557knQt0mQ0
XJlp0XqkZm/ffaXdUPBHpURqOKhaWDeIQw26/uUsiOyZFY8m5g2XfUI/RjSE
wHNePUdYyvi5BSyUQS9emwhmdELqpm5oSGxCPrl1o8Jt2+rHi7/11e883Doj
pd1Q8EelRGo4qFpYN4hDDXyjhoKiuZ6HSadlth7+0QIm2x4eUx+fZtvNBD1G
G3TsEEXw8JGsTO9jtIiOolAlIw+dP0SVUj0qcXDcJid33cUOFVPxjdqqv1Jv
5y0S9+ylTdNnlAVEDkc0GNsFSpdL7aaTqLaCoa5v5IbnQA3bAVHmKTnaHEbd
iz4s3R5aurVdQhoMSuRRqs10DmoUkBChigdbbaU+ySymz9/qXvY/xJrKd013
e9ebisStge/KqieEr5rc94Vk5QdwG0/cnrmhWcfYlTbObprhHRyd+/tSmqjR
d75cRyouMriuqiOJ7SIW3k3ZoxCEuHgPQ6WZXakoSLkQjvMV68OMYooc/+tq
8NuPUnQUb2pRS4mZFvJ4Qb1/F4uOcyrctldBgdJNwtAGaelk+qlMs5h7gvTE
ZRTPt2nna9TtwAmi23ZF7Bsv9d51cq2YOFeD8OGcKBJ7QawZINs82/0oMNYQ
Q9KIIS9HdPDzxdbxPolL8UKtze4yVZWz0/I25EkQZCGawcMCELj9uuHn3Afm
qiSwi2a2vsuY7WdMRDyRl51q1Qg7uEuFs5bzGx1OzJN4U4xhG2N/jgXYtQMA
9Po7RGWjuWjczdCVU3yjWIS9TNDNhpp0L6megqXCa5bQYcI/yDaLeS2e1YJV
MK4MjMrFIN/1m9xVFhTAlVlr01qJeOpDMI7opAzxyHxoqJM9JH2tHuYnPZtk
r6xyXeJwmwm3pCXmQklqhFAAq4wcOYSU8KerWT4vveGjaXeREDvz04Cp96lJ
gH3XKHZUeApTruivvaMRK0ikGD/5vcnfQv7FXh+A9tX6rZ7wPJPG1Fp+zNO6
mMBTcXPQCzawa+Mz2MGt8RL+ukoQsF7SEA+DdGm3VP62oocyPOX67bioYq67
Tss3Zfk/mnJOILL0Q0zLNPWtjFO8/TiTL4DVQ/OlRsRFCfmspn5j+ZMFZNrb
gI0INiOje1tlwYsMztfYZmOj8ba5/idH814oQRVgv25D6KWriZrPdU/SxpdO
AVs51oo5vtvidxgnLj5ut4zMWIaaEEeQoabKSES4KGkOfv5Wt9US519nkct9
VCEKZb5PTFIb1WXyYSGfs3NIvCDbB/bcWsr/HRHmU3tTOcxVohSXoiboevkK
RFfoH04iUNg7HrRc9GE3qrjaylcbIwjVHa45ID7D/0cnT5mnjt/ZTZEVGRkY
xa8c1pV2PaUB3ipjpWBzqcGIyVXjHGQWQeM0C2vf+rRDa9TcFxK90yYPAiex
KX4iu/Evre54S9fNdhKYLHiL0jYApX7IJ4iyWpf1UBHVDo+dWNZf6Av8T2Ge
DyK1305DSKJYzUEFSW3/+jhY/m3VXt+RSJmr0tsF3Bun5r+3cvmjGCaAXi5W
335LDQo5yhgzg4dTmdt2FYjhbIEIIKZlpEylZLDQSXE6yWKsg5ESBGq+lSpy
H56zg4WdRO26Bs0qRmROBcp3uh9rFfV9JL67CYArLd80GAIzJcFV1RvAoGiP
YsBo9C1Mjm4SorSED1Mwo9PYH+LhYmPUAOCaarhwLNIjYg6raPciU7xnV0na
0yssWje1u0NsNswVG+RUYPYSlPUIFGtCnzY5bRnRerl21I1EzNwPob5+ix9X
DgZgKjmA7dShQ4dTOTNZfgc8DyNGGNc36PTKhB2dKjJkVd4FEYbiBO1KrdLX
k/kRqghwY2ERa9BF3BVFju9+wL8gnzKXJP1aQGKQjhnCLk0ReV0ArabwdOuk
tISDJC+FrmmoUH2ZX7uJVJarhwkXz4JM0ezpPPFPB34UUc5vuWvCH9PFjxoG
K7Q+3e2oQMRJI3GqXXeQghdJFKwK8s1GvvYqjcWZnmvVx1ut9zdMkJNu/5BX
ZovsVtNi4menkD3mqAWfTdKd2bOuCaeyCybkauVzyVqLN7PlPWPy8267wQnI
7frhTucnxg23r+/qoAVPaVWhAd6GWrE7niPdjHV+gskZgTwSSURmagpA1ztQ
pOeKwJmDX9e5yZKG5mXf5/TRL7f25FvUxCkj0Lj4LuzeK4BkpPjJqwxMVQyr
T0yndrS1gxSKAwoDfi5NNFiZGdjWspJuttFwrePKmP+7xdOlPpvMcTHnzEo6
LmqbOpV/e4slYS30Ud6QV31hEbyyfWx56JJiaEQnPdMxNZqlWzdE39c1s895
bkrf6Xd/SZ3iX1fC1TjQRiSncv154IUED90qPNFfs2yICGejXiw2dJaJFAtd
FnEOOfpO82rIl4OiyUCVtrEmX+b28U9e0wSKnrVdmyWP1Axk+IDvMijR9O5e
sysV44NZ5BfaC8+WqNOdBctIWuWgIFMh+PIZ3hWII1WONXPiSKLKd34HxIYk
TnmW5uvmQ1S2bZLwF/g/3ekcS/Y6Xegd/OKmR0GsZxGpoMaD5GMTqcmQNfeG
sswcG/LdybN5kmsonyucibonb50bEwbxjb9fUtCGtbHbWAnIFg3a/XsVHSoi
AgQyiY97L1I6SvI24wyD0tExmWLbhrir/WnsPG3P/CEyHLU1IGPZyQlXz9wT
tdGt8JmsNHy3vvYZILkNyfa1L4t4lj9pH7p4etoyD1FJoV7OTcwwHJEA92+4
PWwzy0AkJC5wueYpemIRs9tv+HWwLvP/YgJnIXJOMPcbBPiSBFIujNH2aNu4
7hJkSXXXWGX/c20Xn+iGrzwabKm8fF7iJJgP8yJwT0PdXNnh0f3xZFNnGF3h
J77xic2Z35tapM0EbbM9mc+SHv0v11eVD+qAfeUkSItjHgmklkEmmkkPZG1y
NFBcKmBVpxrwZ9wTtdGt8JmsNHy3vvYZILmJMbdt10m21vYWb1xHLvZNvdK6
fUudJGqrrsrQCB9xlqKuOImF8dDdBeFXpn9rERAt33Uia3RSKwS2M/d/GfSg
G6SSX9gv7TH5sdxISF7Ts094zc2z1mSSFpmFba++znoCtpovh2ZsIzUmm7/z
bsAgrZ4kEmk/Mb9JlHVI8hd+HWJIJtg6uLliOWkp/ewfgNnG4iZhMh2G8BjK
6w1+7hZeS83eKhBMOi5al4EU57IATMNGfVWvmNze5EKqEnMufyEoz+WBffET
hNYBjzoKsMRudIvPewVNevmc+UkSqZ58OH0eNSEX2s+nM9/GMZfcK3JXMke2
1VBKuBO14C8qghyJgmqUMyE1FrvePCfJiuLDvXsx+TFXIwyXBl9ES4Wmx+jy
HVs0kzmkVez8BQ76e7C7GfOx/1bGfSdNzQXDQKL9qllmlK+32PBPvI4bBIM5
g3EkCUssziyuvbP/pjTlKPRGC527j1qHiUJbU/TguK2FwXUzD/7uVLiIZe/9
g2IQ1aaxr4IT+MFD4vEp5EcJ08Q4
END;
