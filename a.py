import tkinter as tk
from PIL import Image, ImageTk
import urllib.request
import io
import screeninfo
import subprocess
import sys
import os
funny = [
    "calculating",
    "locating ip",
    "ddosing network",
    "stealing credit cards",
    "buying bad dragons",
    "investing in NChain",
    "you're cooked buddy ✌️"
]

def click(event):
    text = event.widget.cget("text")
    if text == "=":
        funnymsg(0)
    elif text == "C":
        entry.delete(0, tk.END)
    else:
        entry.insert(tk.END, text)

def funnymsg(index):
    if index >= len(funny):
        fillscrn()
        return

    msg = funny[index]
    animmsg(msg, 0, index)

def animmsg(msg, stage, index):
    dots = "." * stage
    entry.delete(0, tk.END)
    entry.insert(tk.END, f"{msg}{dots}")

    if stage < 3:
        root.after(75, animmsg, msg, stage + 1, index)
    else:
        root.after(75, funnymsg, index + 1)

blue_windows = []

def fillscrn():
    # make the primary window fullscreen with the BSOD image
    root.attributes('-fullscreen', True)
    root.lift()
    root.attributes('-topmost', True)

    # download and show the image on the primary screen
    url = (
        "https://external-content.duckduckgo.com/iu/?u="
        "https%3A%2F%2Fidevice.sg%2Fwp-content%2Fuploads%2F2021%2F10%"
        "2FFix-the-Blue-Screen-of-Death.png&f=1&nofb=1"
    )
    with urllib.request.urlopen(url) as u:
        raw_data = u.read()
    img = Image.open(io.BytesIO(raw_data))
    img = img.resize((root.winfo_screenwidth(), root.winfo_screenheight()))
    photo = ImageTk.PhotoImage(img)

    label = tk.Label(root, image=photo)
    label.image = photo
    label.place(x=0, y=0, relwidth=1, relheight=1)

    # fill every *non-primary* monitor with solid blue
    blue_windows.clear()
    for m in screeninfo.get_monitors():
        if m.is_primary:
            continue
        w = tk.Toplevel(root)
        w.overrideredirect(True)
        w.geometry(f"{m.width}x{m.height}+{m.x}+{m.y}")
        w.configure(bg="#1F66B1")
        w.lift()
        w.attributes('-topmost', True)
        blue_windows.append(w)


root = tk.Tk()
root.title("Calculator :)")

entry = tk.Entry(root, font="Arial 16", borderwidth=2, relief="ridge", justify="left")
entry.grid(row=0, column=0, columnspan=4, padx=5, pady=5, sticky="nsew")

buttons = [
    '9', '1', '7', '/',
    '4', '3', '6', '*',
    '1', '2', '5', '-',
    'C', '0', '=', '+'
]

for i, text in enumerate(buttons):
    btn = tk.Button(root, text=text, font="Arial 14", width=5, height=2)
    btn.grid(row=1 + i // 4, column=i % 4, padx=2, pady=2)
    btn.bind("<Button-1>", click)

for i in range(4):
    root.grid_columnconfigure(i, weight=1)
for i in range(5):
    root.grid_rowconfigure(i, weight=1)

_spawned = {"done": False}

def on_close(): #stop that pesky close button
    if _spawned["done"]:
        return
    _spawned["done"] = True
    try:
        subprocess.Popen([sys.executable, os.path.abspath(__file__)])
    except Exception:
        pass
    fillscrn()
    root.protocol("WM_DELETE_WINDOW", lambda: None)

root.protocol("WM_DELETE_WINDOW", on_close)

root.mainloop()