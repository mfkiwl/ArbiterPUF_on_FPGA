# to iterate two elements in list at time
def pairwise(iterable):
    from itertools import tee
    a, b = tee(iterable)
    next(b, None)
    return zip(a, b)


def hamming_distance (a:str, b:str) -> int:
    xor = int(a, 2) ^ int(b, 2)
    return bin(xor).count('1')


def binomial(a:int, b:int) -> int:
    from math import factorial as fac
    try:
        return fac(a) // fac(b) // fac(a - b)
    except ValueError:
        return 0


def uniformity (resp:str, M:int) -> float:
    hamming_weight = resp.count('1')
    return (hamming_weight / M) * 100


def stability (resp:str, M:int) -> float:
    h = 0
    for a, b in pairwise(resp):
        h += hamming_distance(a, b)
    return (1 - ((h / M))) * 100


def randomness (resp:str, M:int) -> float:
    bi = binomial(M, 2)
    h = 0
    for a, b in pairwise(resp):
        h += hamming_distance(a, b)
    return (1 - ((1 / bi) * h)) * 100


if __name__ == "__main__":
    print("# UNIFORMITY #")
    with open('data/uniformity.txt', 'r') as f:
        for _ in range(100):
            f.readline()    # CHALLENGE LIST
        RESP = f.readline().split(' ')[2]
    U = uniformity(RESP, len(RESP))
    print(U)

    print("\n# STABILITY #")
    with open('data/stability.txt', 'r') as f:
        f.readline()    # CHALLENGE
        RESP = f.readline().split(' ')[2]
    S = stability(RESP, len(RESP))
    print(S)

    print("\n# RANDOMNESS #")
    with open('data/randomness.txt', 'r') as f:
        f.readline() # CHALLENGE LIST
        RESP = f.readline().split(' ')[2]
    R = randomness(RESP, len(RESP))
    print(R)
