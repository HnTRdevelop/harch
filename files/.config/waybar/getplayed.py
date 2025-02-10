from os import popen


status = popen("playerctl status").read().strip().lower()
if status != "":
    metadata = dict()
    for i in popen("playerctl metadata").read().split("\n"):
        if i == "":
            continue
        p = i.find(" ", i.find(":"))
        param = i[i.find(":") + 1:p]
        while i[p] == " ":
            if p == len(i) - 1:
                break
            p += 1
        value = i[p:]
        metadata[param] = value

    print(f"{"" if status == "playing" else ""} {metadata["artist"]}: {metadata["album"]} - {metadata["title"]}".replace("&", "and"))
else:
    print("No player")