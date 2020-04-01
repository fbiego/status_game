# status_game

## info

This [Processing](https://processing.org/) sketch creates a <1 second video which contains airtime recharge digits.
It contains moving shapes and the digits will only be shown when the shapes have aligned with their outline, otherwise it will show random digits.
The video can be posted to platforms such as whatsapp status to challenge your viewers. Since the video is fast moving the viewer has to stop the video at right time to view the digits. The viewer has to recharge using the digits before any other viewer to get the airtime.

This sketch requires [VideoExport library](https://github.com/hamoid/video_export_processing) and the library requires FFmpeg to be installed on your system.

## usage

Change the `String credit` to match your airtime recharge digits and `boolean exp` to `true` to export your video.
The video will be exported to the sketch folder and will be overwritten if it exists.

## video

Output video looks like this, 
_this is a gif file example_
![](export_gif.gif)
