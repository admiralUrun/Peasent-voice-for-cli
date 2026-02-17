#!/bin/bash
# Warcraft 3 Human Peasant NPC — real voice lines
# "Work, work."

SOUNDS_DIR="$HOME/.claude/hooks/sounds/peasant"
CATEGORY="${1:-notification}"

case "$CATEGORY" in
  greeting)
    # "Ready to work!" / "What?" / "More work?" / "Yes milord?"
    FILES=(
      "PeasantReady1.ogg"
      "PeasantWhat4.ogg"
      "PeasantWhat3.ogg"
      "YesMeLord.mp3"
    )
    TITLES=(
      "Ready to work!"
      "What?"
      "More work?"
      "Yes, milord?"
    )
    ;;
  notification)
    # Peasant being clicked — "Yes milord?" / "What is it?" / "More work?" / "What?"
    FILES=(
      "YesMeLord.mp3"
      "PeasantWhat2.ogg"
      "PeasantWhat3.ogg"
      "PeasantWhat4.ogg"
    )
    TITLES=(
      "Yes, milord?"
      "What is it?"
      "More work?"
      "What?"
    )
    ;;
  done)
    # Task complete — "Job's done!" / "All right" / "Off I go then!" / "Okay"
    FILES=(
      "JobsDone.mp3"
      "JobsDone2.mp3"
      "PeasantYes3.ogg"
      "PeasantYes4.ogg"
      "Okay.mp3"
    )
    TITLES=(
      "Job's done!"
      "Job's done!"
      "All right"
      "Off I go then!"
      "Okay"
    )
    ;;
  working)
    # Acknowledging orders — "Right-o" / "Yes milord" / "All right" / "Off I go then!"
    FILES=(
      "PeasantYes1.ogg"
      "PeasantYes3.ogg"
      "PeasantYes4.ogg"
      "Okay.mp3"
    )
    TITLES=(
      "Right-o"
      "All right"
      "Off I go then!"
      "Okay"
    )
    ;;
  permission)
    # Permission needed — "What?" / "More work?" / "Yes milord?"
    FILES=(
      "PeasantWhat2.ogg"
      "PeasantWhat3.ogg"
      "PeasantWhat4.ogg"
      "YesMeLord.mp3"
    )
    TITLES=(
      "What is it?"
      "More work?"
      "What?"
      "Yes, milord?"
    )
    ;;
  annoyed)
    # Clicked too many times — pissed quotes
    FILES=(
      "PeasantPissed5.ogg"
      "PeasantWarcry1.ogg"
    )
    TITLES=(
      "Help! Help! I'm being repressed!"
      "Yaaah!"
    )
    ;;
esac

RANDOM_INDEX=$((RANDOM % ${#FILES[@]}))
SOUND="${SOUNDS_DIR}/${FILES[$RANDOM_INDEX]}"
TITLE="${TITLES[$RANDOM_INDEX]}"

# macOS notification banner
osascript -e "display notification \"$TITLE\" with title \"⚔️ Peasant\"" 2>/dev/null &

# Play the real voice line
afplay "$SOUND" 2>/dev/null &

exit 0
