def count_by(key):
    group_by(key) | map({ key: first|key, value: length });

def inet_aton:
    split(".") | map(tonumber) | (.[0]*pow(256;3)) + (.[1]*pow(256;2)) + (.[2]*256) + .[3];

def inet_ctonr:
    split("/") | (.[0] | inet_aton) as $base | {
        "start": $base,
        "end": ($base + pow(2;32-(.[1]|tonumber)) -1),
    };

def fold: reduce .[] as $x ({}; . * $x);
