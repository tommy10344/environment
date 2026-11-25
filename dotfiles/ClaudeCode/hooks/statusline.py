#!/usr/bin/env python3
# Claude Code の statusLine。標準入力の JSON の rate_limits から、
# 5 時間枠（設定画面の「現在のセッション」）と週間枠（「すべてのモデル」）の
# 使用率とリセット時刻を 1 行で出す。Fable の週間枠は rate_limits に無いので出せない。
#
# rate_limits は API が値を返した後にしか入らないので、セッション開始直後は "--" になる。
# 標準ライブラリだけで書く（python3 -I -S で動かす）。
import json
import sys
import time

WEEKDAYS = "月火水木金土日"
RESET = "\033[0m"


def color(pct):
    if pct >= 90:
        return "\033[31m"
    if pct >= 70:
        return "\033[33m"
    return ""


def bar(pct, width=8):
    filled = round(max(0.0, min(100.0, pct)) / 100 * width)
    return "█" * filled + "░" * (width - filled)


def part(label, limit, weekly):
    if not isinstance(limit, dict) or limit.get("used_percentage") is None:
        return f"{label} --"
    pct = float(limit["used_percentage"])
    text = f"{label} {pct:.0f}% {bar(pct)}"
    c = color(pct)
    if c:
        text = f"{c}{text}{RESET}"
    reset = limit.get("resets_at")
    if reset:
        t = time.localtime(reset)
        when = f"{t.tm_hour}:{t.tm_min:02d}"
        if weekly:
            when += f" ({WEEKDAYS[t.tm_wday]})"
        text += f" {when}にリセット"
    return text


def main():
    try:
        data = json.load(sys.stdin)
    except ValueError:
        return
    limits = data.get("rate_limits") or {}
    print(
        part("セッション", limits.get("five_hour"), False)
        + "  │  "
        + part("週間", limits.get("seven_day"), True)
    )


main()
