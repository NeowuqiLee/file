import requests
import time
import string
import random
import hashlib
import hmac
import urllib


def draw():
    # proxies = {
    #     "http": "http://127.0.0.1:8001",
    #     "https": "http://127.0.0.1:8001",
    # }

    mch_id = "userwh1"
    api_key = "5cod2xsn0bu"

    # mch_id = "userwh1"
    # api_key = "5cod2xsn0bu"

    address="0xd1526cb9e876a3990d80ada3b851860d12a15504"
    wuqi_address="0x97bec9a8175dc12820d330a64d1d3b7837ef177d"

    header = {"timestamp": str(int(time.time()))}
    random_str = ''.join(random.choices(string.ascii_uppercase + string.digits, k=18))
    body = {
        "mch_id": mch_id,
        "out_trade_no": "10001001123419",
        "wid": "1",  # 币种ID 1USDT, 2ETH, 3DAI
        "address": wuqi_address,
        "amount": "29",
        "api_key": api_key,
        "notify_url": "http://8.210.134.205:8080/test",
        "nonce_str": random_str
    }
    sort_body = ksort(body)
    data = toUrlParams(dict(sort_body))+ "key=" + api_key
    data = urllib.parse.quote_plus(data)
    signature = hmac.new(bytes(api_key, encoding='utf-8'), bytes(data, encoding='utf-8'), hashlib.sha256).hexdigest().upper()
    body['sign'] = signature
    try:
        rsp = requests.post('http://47.242.50.124:18100/api/gowithdraw', headers=header, json=body,
                            timeout=10)
        print(rsp.text)
        return rsp.text
    except Exception as e:
        print(repr(e))
        return e

def transfer():
    proxies = {
        "http": "http://127.0.0.1:8001",
        "https": "http://127.0.0.1:8001",
    }

    mch_id="userwuqi1"
    api_key = "wu11f7wyca"

    # mch_id="userwh1"
    # api_key = "5cod2xsn0bu"

    header = {"timestamp": str(int(time.time()))}
    random_str = ''.join(random.choices(string.ascii_uppercase + string.digits, k=18))
    body = {
        "mch_id": mch_id,
        "out_trade_no": "10001001123417",
        "wid": "1",  # 币种ID 1USDT, 2ETH, 3DAI
        "api_key": api_key,
        "notify_url": "http://8.210.134.205:8080/test",
        "nonce_str": random_str
    }
    sort_body = ksort(body)
    data = toUrlParams(dict(sort_body))+ "key=" + api_key
    data = urllib.parse.quote_plus(data)
    signature = hmac.new(bytes(api_key, encoding='utf-8'), bytes(data, encoding='utf-8'), hashlib.sha256).hexdigest().upper()
    body['sign'] = signature
    try:
        rsp = requests.post('http://47.242.50.124:18100/api/gopay', headers=header, proxies=proxies, json=body, timeout=10)
        print(rsp.text)
        return rsp.text
    except Exception as e:
        print(repr(e))
        return e


def toUrlParams(para):
    buff = ""
    for k, v in para.items():
        if k != "sign" and v != "":
            tmp = k + "=" + v + "&"
            buff = buff + tmp
    return buff

def ksort(d):
    return [(k, d[k]) for k in sorted(d.keys())]




if __name__ == '__main__':
    draw()
    #transfer()
