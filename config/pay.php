<?php

return [
    'alipay' => [
        'app_id'         => '2018121162562008',   //你在支付宝沙箱看到的appid
        'ali_public_key' => 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjms0YCGrN29axhTb/4aeLXN8g2dGa/WnOA3iaQmD1VrNfZSr4fMxVFYo8zM2Tvd/sFNxGXMoy/gRc6aT99Yg8FDm90P76/B/4g9k8Z7SksNF541fEYNxjOyMSGRRCBcObLPp568UxhcYXPWw2zmk3PI95Ta1LX/3yFv/TA+LhN3g0JYkT/d/aakTjgsePdC2ld9clYHxFlk9XYMC4yBlhYDxLkafDIi3pMjZaCHsS5kytKmgroDSrgjNJk3n40kDYL6SI3KOyY8C6CDFd/QqDy88TsOZ7j92Ne8e5xCVFGaGCavvOugrx/NPxI59TL1Y4k+Jzyy4blig94BPhs/E9QIDAQAB',   //支付宝沙箱显示的公钥
        'private_key'    => 'MIIEogIBAAKCAQEAnQPFoUNHSd8JqB2SJi5eKsOVmeKzh/GXWw31BS/4fhNTJHscOYW9PYBfzfK3ZqLaBCucJcZBKfQ2EWEVM++Aev/aNJ2Okgt/K8aKXGAsWmiETS1xYjJUvvX0QH4IbsCzJpqDqOkDl7WJ/kRrtfAh5PfWKAKgOMNaj4N2pCqQUMM4jVW7ajnxhzaZHtWDxTcfnVvoYSK8TQnkVf+rMbCUHsvYJKhnk4MI36j+m0MWUxyD8bqY1w9s4s+Bw36e3OYAQ5SSpi9nXkqPFZCLzW2c+XkZZYNjfSqPu6fpPjQ9nElT+VpmVrnbGEhqBah9cjuZHsI6an5L7ql23CVb4zPt5QIDAQABAoIBAAN58Oc4IRzulj0lonW78xPJTsegcE8jNzGp5nHd9Qd9kAqvuxk+78irzfM2W38nPeJ3wLZJZGn0YToTRy/mLpcKkR83Gc/79y3V8HxJGNJLnBpFVkxRRvUPZwACildBZvYE18NmnVC/kTWS+DuH/IggQJqULE31bUzeIUNTOey/zN8amDMfl9QFiwjZtI7xRB9L3Id1nwf/vpChCuciLse7DtRSk9gmNRT9yQ35mMRY3ZcVuEbBtWf4p9DTegaSxGOn3wQurACMWBU93Sqyb2BsH+d9O4LUZXPxm1/DsmtMiNfOtIHhSmQE0VSGoPoJ2aCmMEKStyb6KBCj2BKdJKUCgYEA0NyT0Cf3cBLvD256AndB+fV1DxBwDlqxEt8z4ilhH0vxKCaMeeN8ulWSdYESeIrXejDy0ifSqbLhIJB7mPjaH8+cm6NR1Pot9hjUNj0HsXgcVpzAder3N76H9SIiq5BB+3eF6qE2FFVRL/OIiNm3AOcKqmEweMH2IF7L85W0z3cCgYEAwHOhZvxuF6oGbNyCxuFOwxvRtURSQxjZKOhPTulrhiEKk9+D0PpK5bR0Y2N4St69ujEck0Jh9eEOWeFzFQ4Sw57Lj/dz25IZT30vpb2ibCXiFZkZ6HGTzRQM19C4cOD86Uu+5zpm+HXUO2vvWTg3uuLi+v6492WiCk7JqumZXIMCgYAXWCAZSu5IE4Wuxt1SOzwfkQTFa0PrBs312wa0h4V4dwd8Qlq/IOMG/JuDEKsc1//fg2sQfCz6lKi++AcogN/4YD8T0jxKPrA2am4FpeqfNlqMf7avN1TsYRpXFrqjTFtjnOdV4zDlMugBIQooqZTfv/McOgKt7Jfy5EWNczUjXwKBgE7ERLAI6upGjYCqs9/AQWM7lJYTE3QgzGigxCzw/jAUf+bL2YCDoHnpZKV1Bbvm9FIrXZ2r0ro21Y/V5Ssd6nIkIP6YcdPRNQjCnOjB96M50hGy6tam/a424ZbG92ZDv1+gv86VqaVRXH7Bi2HBz5Vu3SWLcZrX/v0nCAUqvLkPAoGAKvLnOJSsiJWRoFb6jjLJruA86Aro5C87TKdpMlzLBAPAuJ3Y9zEUP49c6ZtR4q4QsChYv9Lk5Pw3v8VMMwEdm25xl6q3o9GNSOQPAx7gXLq9kaiNQ5ShHv0IhQ7AdwYYQt4/fR7cdu760o+bnGSTCIQPLOqvS4fEllYfI+i9pzc=',   //刚刚生成的私钥
        'log'            => [
            'file' => storage_path('logs/alipay.log'),
        ],
    ],

    'wechat' => [
        'app_id'      => 'wxba88116cd0f494f1',
        'mch_id'      => '1435696402',
        'key'         => '431ccc08b621a02167105268e673da57',
        'cert_client' => resource_path('wechat_pay/apiclient_cert.pem'),
        'cert_key'    => resource_path('wechat_pay/apiclient_key.pem'),
        'log'         => [
            'file' => storage_path('logs/wechat_pay.log'),
        ],
    ],
];