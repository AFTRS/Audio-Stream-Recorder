#!/bin/sh
# Records and compresses audio streams for one hour using mplayer for the recording and lame for the MP3 conversion
# By Tim Mohr
# Australian Film Television and Radio School
#
# Give the stream a friendly name
streamName="My Favourite Online Radio Station"
# Put the absolute URL to the stream location. Tested OK with 128k MP3 streams
streamLink="http://somestreamingservice.com/live/mp3/128/stream.mp3"
# Recorded files folder location WITHOUT trailing slash
fileLocation="/home/tim/Dropbox/Radio"
# Time Set
time=$(date +"%b-%d-%y--%k-%M")
mplayer $streamLink -ao "pcm:file=/tmp/mystream-$time.wav" -vc dummy -vo null -endpos "01:00:00" -nocache;
lame -m s "/tmp/mystream-$time.wav" -o "$fileLocation/$streamName-$time.mp3" --tt "$streamName $time" --ta $streamName ;
rm "/tmp/mystream-$time.wav" ;
