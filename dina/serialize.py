from __future__ import annotations
import struct
Int64 = int

special_bit = 0b10000000

obj_box_tags: dict[type, int| None] = {
    int: 0,
    float: 1,
    str: 2,
    dict: 3,
    set: 4,
    list: 5,
    tuple: 6
}


def encode_to_7bit(value: int, barr: bytearray):
    data = []
    number = abs(value)
    while number >= 0x80:
        data.append((number | 0x80) & 0xff)
        number >>= 7
    barr.append(number & 0xff)


def serialize_(o, barr: bytearray):
    if isinstance(o, bool):
        raise

    match o:
        case int(): 
            barr.extend(struct.pack('<i', o))
        case float():
            barr.extend(struct.pack('<f', o))
        case str(): # or InternString
            encoded = bytes(o, 'utf8')
            encode_to_7bit(len(encoded), barr)
            barr.extend(encoded)
        case dict():
            serialize_(len(o), barr)
            for k, v in o.items():
                serialize_(k, barr)
                serialize_(v, barr)  # type: ignore
        case list() | set():
            serialize_(len(o), barr)
            for v in o:  # type: ignore
                serialize_(v, barr)
        case tuple():
            for v in o:  # type: ignore
                serialize_(v, barr)
        case None:
            barr.append(special_bit)
        case _:
            o.serialize_(barr)


if __name__ == '__main__':
    b = bytearray()
    serialize_([1, 2, 3], b)