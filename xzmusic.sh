#!/bin/bash
# download then convert to AAC

                                   
function extracAudio() {
    youtube-dl \
        -v \
        --geo-bypass \
        --postprocessor-args "-ar 44100" \
        -x -f "bestaudio[acodec=opus]/bestaudio/best" \
        --audio-format m4a \
        --audio-quality 256 \
        --no-playlist \
        -i \
        -o "./youtube-dl/%(playlist)s - %(artist)s/%(track)s.%(title)s.%(alt_title)s.%(ext)s" \
        --download-archive "./youtube-dl/Downloaded.txt" \
        --add-metadata \
        --metadata-from-title "%(artist)s - %(title)s - %(alt_title)s" \
        $1

}

extracAudio $1