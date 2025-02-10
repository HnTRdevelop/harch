from time import strftime

H = int(strftime("%H"))
H = 12 if H == 0 else H
H = H - 12 if H > 12 else H
print(strftime(f"{H:02}:%M:%S %p {"󰏟" if int(strftime("%S")) % 2 == 0 else "󱤩"} %A %d/%m/%Y"))
# 󰏟 󱤩