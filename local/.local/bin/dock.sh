#!/usr/bin/env bash
set -euo pipefail

LAPTOP="eDP-1"
MONITOR="HDMI-2"

# 1) Enable and position external display
xrandr --output "$MONITOR" --auto --right-of "$LAPTOP"

# Give X/i3 a moment to register the output
sleep 0.2

# 2) Workspace placement
# Workspace 1 stays on laptop
i3-msg "workspace 1; move workspace to output ${LAPTOP}"

# Workspaces 2–5 go to external monitor
for ws in 2 3 4 5; do
  i3-msg "workspace ${ws}; move workspace to output ${MONITOR}"
done

# 3) Move the currently focused terminal from workspace 1 → workspace 3
i3-msg "move container to workspace 3"

# Optional: focus workspace 3 on the monitor
i3-msg "workspace 3"
