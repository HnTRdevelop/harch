from time import strftime

H = int(strftime("%H"))
H = 12 if H == 0 else H
H = H - 12 if H > 12 else H
right = strftime(f"{H:02}:%M:%S %p")
left = strftime(f"%A %d/%m/%y")
left = left[:2] + left[left.find(" "):]
print(strftime(f"{right} {"󰏟" if int(strftime("%S")) % 2 == 0 else "󱤩"} {left}"))
# 󰏟 󱤩
