#!/bin/sh

swaylock --screenshots --clock \
--indicator-radius 100 \
--indicator-thickness 5 \
--ignore-empty-password \
--bs-hl-color d65d0e \
--ring-color 7c6f64 \
--ring-clear-color 7c6f64 \
--ring-caps-lock-color 7c6f64 \
--ring-ver-color 7c6f64 \
--ring-wrong-color 7c6f64 \
--key-hl-color ebdbb2 \
--text-color fabd2f \
--text-clear-color fabd2f \
--text-caps-lock-color fabd2f \
--text-ver-color 83a598 \
--text-wrong-color fb4934 \
--font Iosevka Term Regular \
--line-color 00000000 \
--line-clear-color 00000000 \
--line-caps-lock-color 00000000 \
--line-ver-color 00000000 \
--line-wrong-color 00000000 \
--inside-color 00000088 \
--inside-clear-color 00000088 \
--inside-ver-color 00000088 \
--inside-wrong-color 00000088 \
--separator-color 00000000 \
--effect-blur 14x10 \
"$@"
